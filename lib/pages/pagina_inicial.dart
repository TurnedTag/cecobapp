import 'dart:convert';
import 'destaque_page.dart';
import 'lista_eventos_page.dart';
import './lista_atividades_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import '../providers/auth_provider.dart';
import '../components/custom_header.dart';
import '../components/top_activities.dart';
import '../components/custom_map_view.dart';
import '../components/custom_button_row.dart';
import '../components/custom_bottom_nav.dart';
import 'package:teste/pages/melhoria_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({super.key});

  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  LatLng? _initialPosition;
  List<dynamic> _topActivities = [];

  @override
  void initState() {
    super.initState();
    _loadInitialPosition();
    _fetchTopActivities();
  }

  Future<void> _loadInitialPosition() async {
    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      await authProvider.loadFromStorage();
      if (authProvider.cep != null) {
        await _setInitialPosition(authProvider.cep!);
      }
    } catch (e) {
      print('Error loading initial position: $e');
    }
  }

  Future<void> _setInitialPosition(String cep) async {
    try {
      final location = await getLatLngFromCep(cep);
      if (location != null && mounted) {
        setState(() {
          _initialPosition = location;
        });
      } else {
        if (kDebugMode) {
          print('Não foi possível obter a localização');
        }
      }
    } catch (e) {
      print('Error setting initial position: $e');
    }
  }

  Future<LatLng?> getLatLngFromCep(String cep) async {
    try {
      const apiKey = 'CRyzEbOjIm4D6VTg7YKiY4ZdrKPxMp8D2NV7q_IJdFE';
      final url =
          'https://geocode.search.hereapi.com/v1/geocode?q=$cep&apiKey=$apiKey';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        if (json['items'] != null && json['items'].isNotEmpty) {
          final location = json['items'][0]['position'];
          final lat = location['lat'];
          final lng = location['lng'];
          return LatLng(lat, lng);
        } else {
          if (kDebugMode) {
            print('Erro na resposta do Geocoding API');
          }
          return null;
        }
      } else {
        if (kDebugMode) {
          print('Erro na requisição HTTP: ${response.statusCode}');
        }
        return null;
      }
    } catch (e) {
      print('Error getting LatLng from CEP: $e');
      return null;
    }
  }

  Future<void> _fetchTopActivities() async {
    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final activities = await authProvider.getTopActivitiesFromDistrict();
      if (activities != null && mounted) {
        setState(() {
          _topActivities = activities;
        });
      }
    } catch (e) {
      print('Error fetching top activities: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF236BBE),
      appBar: const CustomHeader(title: 'Bairro'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CustomMapView(
              initialPosition: _initialPosition,
              onMapCreated: (controller) {
                // Store the map controller if needed
              },
            ),
            const SizedBox(height: 60),
            CustomButtonRow(
              onDestaquesPressed: () {
                /*
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Destaque(),
                  ),
                );
                */
              },
              onMelhoriasPressed: () {
                /*
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaginaInicial2(),
                  ),
                );
                */
              },
            ),
            const SizedBox(height: 30),
            Expanded(
              child: TopActivities(topActivities: _topActivities),
            ),
            const SizedBox(height: 30),
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
                  onPressed: () {},
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
}
