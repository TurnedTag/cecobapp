import 'package:flutter/material.dart';
import 'package:teste/pages/destaque_page.dart';
import 'package:teste/pages/ativdade.dart';
import 'package:teste/pages/lista_atividades_page.dart';
import 'package:teste/pages/melhoria_page.dart';
import 'package:teste/pages/pagina_inicial.dart';
import '../components/custom_bottom_nav.dart';
import '../components/custom_header.dart';
import '../services/activity_service.dart';

class ListaEventos extends StatefulWidget {
  const ListaEventos({Key? key}) : super(key: key);

  @override
  _ListaEventosState createState() => _ListaEventosState();
}

class _ListaEventosState extends State<ListaEventos> {
  final ActivityService _activityService = ActivityService();
  List<Map<String, dynamic>> _activities = [];

  @override
  void initState() {
    super.initState();
    _fetchActivities();
  }

  Future<void> _fetchActivities() async {
    List<dynamic>? activities =
        await _activityService.getActivitiesWithPresence();
    if (activities != null) {
      setState(() {
        _activities = List<Map<String, dynamic>>.from(activities);
      });
    }
  }

  void _likeActivity(int index) async {
    final activityId = _activities[index]['_id'];
    final response = await _activityService.likeActivity(activityId);

    if (response != null) {
      await _fetchActivities();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF236BBE),
      appBar: const CustomHeader(title: 'Eventos'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Expanded(
              child: _activities.isNotEmpty
                  ? MessageList(
                      messages: _activities,
                      onLike: _likeActivity,
                    )
                  : const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Nenhuma atividade encontrada',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
            ),
            const SizedBox(height: 10),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Melhoria()),
                    );
                  },
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
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MessageList extends StatelessWidget {
  final List<Map<String, dynamic>> messages;
  final Function(int) onLike;

  const MessageList({
    Key? key,
    required this.messages,
    required this.onLike,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: messages.map((message) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 40,
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 30, 46, 53),
                      borderRadius: BorderRadius.circular(12.0),
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
                          message["title"],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          message["description"],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          '${message["address"]["street"]}, ${message["address"]["district"]}',
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
                                onLike(messages.indexOf(message));
                              },
                              color: Colors.white,
                              iconSize: 24.0,
                            ),
                            Text(
                              (message["likes"]?.length ?? 0).toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Atividade(activityId: message["_id"]),
                                  ),
                                );
                              },
                              style: TextButton.styleFrom(
                                foregroundColor:
                                    const Color.fromARGB(255, 75, 138, 245),
                              ),
                              child: const Text(
                                'Entrar na Atividade',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
