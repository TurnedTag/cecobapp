import 'package:flutter/material.dart';
import 'lista_atividades_page.dart';
import 'pagina_inicial.dart';
import '../components/custom_button.dart';

class AtencaoPage extends StatelessWidget {
  const AtencaoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF236BBE),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "ATENÇÃO!",
              style: TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const Text(
              "Estão ocorrendo atividades de melhoria no seu bairro! Clique no botão abaixo para acessá-las ",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ListaAtividades(),
                        ),
                      );
                    },
                    text: 'Atividades',
                    backgroundColor: const Color(0xff9181F4),
                    fixedSize: const Size(150, 70),
                  ),
                ),
                const SizedBox(width: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaginaInicial(),
                        ),
                      );
                    },
                    text: 'Sair',
                    backgroundColor: const Color(0xff9181F4),
                    fixedSize: const Size(150, 70),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "Vamos melhorar nossos bairros!",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
