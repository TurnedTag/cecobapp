import 'package:flutter/material.dart';
import 'apiService.dart';
import 'paginaInicial.dart';
import 'novoLogin.dart';

void main() => runApp(MaterialApp(
      title: "App",
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ApiService _apiService = ApiService();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    final response = await _apiService.login(username, password);

    if (response != null) {
      _showDialog("Sucesso", "Login bem-sucedido", true);
    } else {
      _showDialog("Erro", "Falha no login", false);
    }
  }

  void _showDialog(String title, String message, bool success) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                if (success) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Inicio()),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF236BBE),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 140),
              Container(
                child: Image.asset("assets/logo.png"),
                height: 200,
                width: 200,
              ),
              SizedBox(height: 20),
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
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: 'E-mail',
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
                  controller: _passwordController,
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
                onPressed: _login,
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
              SizedBox(height: 210),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
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
      ),
    );
  }
}
