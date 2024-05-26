// ignore_for_file: avoid_print, file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:teste/PaginaInicial2.dart';
import 'package:teste/atividade.dart';
import 'package:teste/destaque.dart';
import 'package:teste/eventos.dart';
import 'package:teste/melhoria.dart';

// ignore: use_key_in_widget_constructors
class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  // ignore: unused_field
  GoogleMapController? _mapController;
  LatLng? _initialPosition;

  @override
  void initState() {
    super.initState();
    _setInitialPosition('22250-110');
  }

  Future<void> _setInitialPosition(String cep) async {
    final location = await getLatLngFromCep(cep);
    if (location != null) {
      setState(() {
        _initialPosition = location;
      });
    } else {
      print('Não foi possível obter a localização');
    }
  }

  Future<LatLng?> getLatLngFromCep(String cep) async {
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
        print('Erro na resposta do Geocoding API');
        return null;
      }
    } else {
      print('Erro na requisição HTTP: ${response.statusCode}');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF236BBE),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            const Text(
              'CECOB Bairro',
              style: TextStyle(
                color: Color(0xff9CD5FF),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 370,
              height: 270,
              color: Colors.blue.shade200,
              child: _initialPosition == null
                  ? const Center(child: CircularProgressIndicator())
                  : GoogleMap(
                      onMapCreated: (controller) {
                        _mapController = controller;
                      },
                      initialCameraPosition: CameraPosition(
                        target: _initialPosition!,
                        zoom: 16,
                      ),
                    ),
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    fixedSize: const Size(150, 60),
                  ),
                  child: const Text(
                    'Destaques',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Inicio2()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    fixedSize: const Size(150, 60),
                  ),
                  child: const Text(
                    'Melhorias',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              width: 390,
              height: 235,
              color: Colors.blue.shade200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Recomendações",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      )),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 8.0),
                        Container(
                          width: 300,
                          height: 30,
                          color: Colors.black,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Escola Ort, endereço: Rua Dona Mariana 213, botafogo.",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 8.0),
                        Container(
                          width: 300,
                          height: 30,
                          color: Colors.black,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Escola Ort, endereço: Rua Dona Mariana 213, botafogo.",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 8.0),
                        Container(
                          width: 300,
                          height: 30,
                          color: Colors.black,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Escola Ort, endereço: Rua Dona Mariana 213, botafogo.",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Container(
                    color: Colors.black,
                    height: 80,
                    width: 450,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Destaque()));
                              },
                              icon: const Column(
                                children: [
                                  Icon(Icons.local_activity,
                                      color: Colors.black,
                                      size: 20), // Reduzi o tamanho do ícone
                                  SizedBox(
                                      height:
                                          3), // Reduzi o espaçamento vertical
                                  Text(
                                    "Destaques",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 5, // Reduzi o tamanho do texto
                                    ),
                                  ),
                                ],
                              ),
                              label: const SizedBox.shrink(),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Reduzi o raio da borda
                                ),
                                elevation: 2,
                                fixedSize: const Size(
                                    60, 35), // Reduzi o tamanho do botão
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => melhoria()));
                              },
                              icon: const Column(
                                children: [
                                  Icon(Icons.trending_up,
                                      color: Colors.black, size: 20),
                                  SizedBox(height: 3),
                                  Text(
                                    "Melhoria",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 5,
                                    ),
                                  ),
                                ],
                              ),
                              label: const SizedBox.shrink(),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                elevation: 2,
                                fixedSize: const Size(60, 35),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Column(
                                children: [
                                  Icon(Icons.location_city,
                                      color: Colors.black, size: 20),
                                  SizedBox(height: 3),
                                  Text(
                                    "Bairro",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 5,
                                    ),
                                  ),
                                ],
                              ),
                              label: const SizedBox.shrink(),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                elevation: 2,
                                fixedSize: const Size(60, 35),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => atividade()));
                              },
                              icon: const Column(
                                children: [
                                  Icon(Icons.cleaning_services,
                                      color: Colors.black, size: 20),
                                  SizedBox(height: 3),
                                  Text(
                                    "Atividade",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 5,
                                    ),
                                  ),
                                ],
                              ),
                              label: const SizedBox.shrink(),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                elevation: 2,
                                fixedSize: const Size(60, 35),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Eventos()));
                              },
                              icon: const Column(
                                children: [
                                  Icon(Icons.event,
                                      color: Colors.black, size: 20),
                                  SizedBox(height: 3),
                                  Text(
                                    "Eventos",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 5,
                                    ),
                                  ),
                                ],
                              ),
                              label: const SizedBox.shrink(),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                elevation: 2,
                                fixedSize: const Size(60, 35),
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
          ],
        ),
      ),
    );
  }
}
