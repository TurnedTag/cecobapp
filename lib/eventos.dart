import 'package:flutter/material.dart';
import 'package:teste/atividade.dart';
import 'package:teste/destaque.dart';
import 'package:teste/melhoria.dart';
import 'package:teste/paginaInicial.dart';

class Eventos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF236BBE),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'CECOB Eventos',
                  style: TextStyle(
                    color: Color(0xFF236BBE),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "23/11/2023",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Container(
                    color: Colors.black,
                    height: 40,
                    width: 400,
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          "Pré Banca",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Container(
                    color: Colors.black,
                    height: 40,
                    width: 400,
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          "Pré Banca",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 475),
            Column(
              children: [
                SizedBox(height: 40),
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
                              icon: Column(
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
                              label: SizedBox.shrink(),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Reduzi o raio da borda
                                ),
                                elevation: 2,
                                fixedSize:
                                    Size(60, 35), // Reduzi o tamanho do botão
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
                              icon: Column(
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
                              label: SizedBox.shrink(),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                elevation: 2,
                                fixedSize: Size(60, 35),
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
                                        builder: (context) => Inicio()));
                              },
                              icon: Column(
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
                              label: SizedBox.shrink(),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                elevation: 2,
                                fixedSize: Size(60, 35),
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
                              icon: Column(
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
                              label: SizedBox.shrink(),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                elevation: 2,
                                fixedSize: Size(60, 35),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: Column(
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
                              label: SizedBox.shrink(),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                elevation: 2,
                                fixedSize: Size(60, 35),
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
