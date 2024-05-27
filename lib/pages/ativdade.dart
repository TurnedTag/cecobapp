import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../components/comment_list.dart';
import '../components/custom_header.dart';
import '../services/activity_service.dart';
import '../components/custom_text_field.dart';

class Atividade extends StatefulWidget {
  final String activityId;

  const Atividade({Key? key, required this.activityId}) : super(key: key);

  @override
  _AtividadeState createState() => _AtividadeState();
}

class _AtividadeState extends State<Atividade> {
  final ActivityService _activityService = ActivityService();
  final TextEditingController _messageController = TextEditingController();
  final ValueNotifier<String> _presencaCount = ValueNotifier<String>("");
  List<Map<String, dynamic>> _comments = [];

  String activityTitle = "";
  String activityDescription = "";
  String activityAuthor = "";
  String activityCreatedAt = "";

  @override
  void initState() {
    super.initState();
    _fetchActivityDetails();
  }

  Future<void> _fetchActivityDetails() async {
    final response = await _activityService.getActivity(widget.activityId);

    if (response != null) {
      setState(() {
        activityTitle = response['title'];
        activityDescription = response['description'];
        activityAuthor = response['author']['username'];
        activityCreatedAt = DateFormat('dd/MM/yyyy HH:mm')
            .format(DateTime.parse(response['createdAt']));
        _comments = List<Map<String, dynamic>>.from(response['comments']);
        _presencaCount.value = response['presence'].length.toString();
      });
    }
  }

  Future<void> _sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      final response = await _activityService.addCommentToActivity(
          widget.activityId, _messageController.text);
      if (response != null) {
        final newResponse =
            await _activityService.getActivity(widget.activityId);
        if (newResponse != null) {
          setState(() {
            _comments =
                List<Map<String, dynamic>>.from(newResponse['comments']);
            _messageController.clear();
          });
        }
      }
    }
  }

  Future<void> _markPresence() async {
    final response = await _activityService.presenceActivity(widget.activityId);
    if (response != null && response['presenceCount'] != null) {
      _presencaCount.value = response['presenceCount'].toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF236BBE),
      appBar: const CustomHeader(title: 'Detalhes da Atividade'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              activityTitle,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10.0),
            Text(
              'Criado por $activityAuthor em $activityCreatedAt',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                activityDescription,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              height: 3.0,
              width: double.infinity,
              color: Colors.black,
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _markPresence,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 99, 191, 253),
                    ),
                    child: const Text(
                      'Marcar Presença',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ValueListenableBuilder<String>(
                  valueListenable: _presencaCount,
                  builder: (context, value, child) {
                    return ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3E92CC),
                      ),
                      child: Text(
                        value,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: _messageController,
                    hintText: 'Digite uma mensagem...',
                    hintColor: const Color.fromARGB(255, 90, 90, 90),
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _sendMessage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3E92CC),
                  ),
                  child: const Text(
                    'Enviar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: _comments.isEmpty
                  ? const Center(
                      child: Text(
                        'Nenhuma mensagem enviada ainda.',
                        style: TextStyle(color: Colors.white70),
                      ),
                    )
                  : CommentList(
                      comments: _comments,
                    ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3E92CC),
                ),
                child: const Text(
                  'Voltar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
