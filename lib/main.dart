import 'package:flutter/material.dart';
import 'package:teste/atencao.dart';

import 'package:teste/novoLogin.dart';

void main() => runApp(MaterialApp(
      title: "App",
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF236BBE),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 20),
            Container(
              child: Image.asset("assets/logo.png"),
              height: 200,
              width: 200,
            ),
            Text(
              'Login',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Nome de Usuário',
                  fillColor: Color(0xff9CD5FF),
                  filled: true,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Senha',
                  fillColor: Color(0xff9CD5FF),
                  filled: true,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Atencao()));
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xff9181F4),
                fixedSize: Size(150, 70),
              ),
              child: Text(
                'Entrar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  color: Color(0xffF0EDFF),
                  height: 5,
                  width: 100,
                ),
                Text(
                  'Login com outros',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                Container(
                  color: Color(0xffF0EDFF),
                  height: 5,
                  width: 100,
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para entrar com o Google
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                fixedSize: Size(200, 60),
              ),
              child: Text(
                'Entrar com o Google',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Lógica para entrar com o Facebook
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                fixedSize: Size(200, 60),
              ),
              child: Text(
                'Entrar com o Facebook',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text(
                'Não tem conta? Crie uma',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
