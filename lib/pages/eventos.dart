import 'destaque_page.dart';
import 'pagina_inicial.dart';
import 'lista_atividades_page.dart';
import 'package:flutter/material.dart';
import '../components/custom_header.dart';
import '../components/custom_bottom_nav.dart';
import 'package:teste/pages/melhoria_page.dart';

class Eventos extends StatelessWidget {
  const Eventos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF236BBE),
      appBar: const CustomHeader(title: 'CECOB Eventos'),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
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
            const SizedBox(height: 30),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Container(
                    color: Colors.black,
                    height: 40,
                    width: 350,
                    child: const Row(
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
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Container(
                    color: Colors.black,
                    height: 40,
                    width: 350,
                    child: const Row(
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
            const Spacer(),
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
