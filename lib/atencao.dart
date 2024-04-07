import 'package:flutter/material.dart';
import 'package:teste/atividade.dart';
import 'package:teste/paginaInicial.dart';


class Atencao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade400,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("ATENÇÃO!",
            style: TextStyle(
              color: Colors.yellow,
              fontWeight: FontWeight.bold,
              fontSize: 25,

              
            ),
            ),
            Text("Estão ocorrendo atividades de melhoria no seu bairro! Clique no botão abaixo para acessá-las ",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
            ),
            SizedBox(height: 20), 
            Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Padding(
      padding: EdgeInsets.all(8.0), // Add padding of 8.0 to all sides
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => atividade()));
        },
        style: ElevatedButton.styleFrom(
          primary: Color(0xff9181F4), // Cor do botão (pode ser personalizada)
          fixedSize: Size(150, 70),
        ),
        child: Text(
          'Atividades',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ),

    SizedBox(width: 20),

    Padding(
      padding: EdgeInsets.all(8.0), // Add padding of 8.0 to all sides
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Inicio()));
        },
        style: ElevatedButton.styleFrom(
          primary: Color(0xff9181F4), // Cor do botão (pode ser personalizada)
          fixedSize: Size(150, 70),
        ),
        child: Text(
          'Sair',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ),
  ],
),

            SizedBox(height: 30),
            Text("Vamos melhorar nossos bairros!",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            )
          ],
          
        ),
      ),
    );
  }
}