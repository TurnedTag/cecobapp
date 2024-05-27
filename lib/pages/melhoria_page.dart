import 'package:flutter/material.dart';
import 'package:teste/data/activity_data.dart';
import 'package:teste/pages/destaque_page.dart';
import 'package:teste/pages/pagina_inicial.dart';
import 'package:teste/pages/lista_eventos_page.dart';
import 'package:teste/components/custom_header.dart';
import 'package:teste/components/custom_dropdown.dart';
import 'package:teste/services/enhancement_service.dart';
import 'package:teste/pages/lista_atividades_page.dart';
import 'package:teste/components/custom_bottom_nav.dart';
import 'package:teste/components/custom_text_field.dart';

class Melhoria extends StatefulWidget {
  const Melhoria({Key? key}) : super(key: key);

  @override
  _MelhoriaState createState() => _MelhoriaState();
}

class _MelhoriaState extends State<Melhoria> {
  final TextEditingController _textController = TextEditingController();
  final EnhancementService _enhancementService = EnhancementService();
  final dropValue = ValueNotifier("");
  List<Map<String, dynamic>> _enhancements = [];

  @override
  void initState() {
    super.initState();
    _fetchEnhancements();
  }

  Future<void> _fetchEnhancements() async {
    List<dynamic>? enhancements = await _enhancementService.listEnhancements(
        district: dropValue.value.isNotEmpty ? dropValue.value : null);
    if (enhancements != null) {
      setState(() {
        _enhancements = List<Map<String, dynamic>>.from(enhancements);
      });
    }
  }

  void _likeEnhancement(int index) async {
    final enhancementId = _enhancements[index]['_id'];
    final response = await _enhancementService.likeEnhancement(enhancementId);
    if (response != null) {
      await _fetchEnhancements();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF236BBE),
      appBar: const CustomHeader(title: 'Melhorias'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: CustomTextField(
                          controller: _textController,
                          hintText: 'Melhoria',
                          hintColor: const Color.fromARGB(255, 116, 116, 116),
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_rounded),
                        color: Colors.white,
                        iconSize: 40.0,
                        onPressed: () {
                          _exibirMensagem(context, _textController.text);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  CustomDropdown(
                    items: dropOpcoes,
                    onChanged: (String? escolha) {
                      dropValue.value = escolha!;
                      _fetchEnhancements();
                    },
                    hint: 'Escolha o Bairro',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              color: Colors.white,
              height: 3,
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: _enhancements.map((enhancement) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: _buildEnhancementCard(enhancement),
                    );
                  }).toList(),
                ),
              ),
            ),
            CustomBottomNav(
              items: [
                CustomBottomNavItem(
                  icon: Icons.local_activity,
                  text: "Destaques",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Destaque()),
                    );
                  },
                ),
                CustomBottomNavItem(
                  icon: Icons.trending_up,
                  text: "Melhoria",
                  onPressed: () {},
                ),
                CustomBottomNavItem(
                  icon: Icons.location_city,
                  text: "Bairro",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaginaInicial()),
                    );
                  },
                ),
                CustomBottomNavItem(
                  icon: Icons.cleaning_services,
                  text: "Atividade",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListaAtividades()),
                    );
                  },
                ),
                CustomBottomNavItem(
                  icon: Icons.event,
                  text: "Eventos",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListaEventos()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEnhancementCard(Map<String, dynamic> enhancement) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 30, 46, 53),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            enhancement["message"],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            '${enhancement["address"]["district"]}',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.thumb_up),
                onPressed: () {
                  _likeEnhancement(_enhancements.indexOf(enhancement));
                },
                color: Colors.white,
                iconSize: 24.0,
              ),
              Text(
                enhancement["likes"].length.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _exibirMensagem(BuildContext context, String mensagem) async {
    Map<String, dynamic>? newEnhancement =
        await _enhancementService.createEnhancement(
      mensagem,
      {"district": dropValue.value},
    );

    if (newEnhancement != null) {
      setState(() {
        _enhancements.add(newEnhancement);
        _enhancements = _organizarEnhancements();
      });
    }
  }

  List<Map<String, dynamic>> _organizarEnhancements() {
    _enhancements
        .sort((a, b) => b["likes"].length.compareTo(a["likes"].length));
    return _enhancements;
  }
}
