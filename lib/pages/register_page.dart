import 'package:flutter/material.dart';
import '../services/user_service.dart';
import '../components/custom_text_field.dart';
import '../main.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final UserService _userService = UserService();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _register() async {
    final username = _usernameController.text;
    final email = _emailController.text;
    final cep = _cepController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      _showDialog("Erro", "As senhas não coincidem", false);
      return;
    }

    final response =
        await _userService.register(username, email, password, cep);

    if (response != null) {
      _showDialog("Sucesso", "Registro bem-sucedido", true);
    } else {
      _showDialog("Erro", "Falha no registro", false);
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
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                if (success) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const MyApp()),
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
      backgroundColor: const Color(0xFF236BBE),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              SizedBox(
                height: 220,
                width: 220,
                child: Image.asset("assets/logo.png"),
              ),
              const SizedBox(height: 20),
              const Text(
                'Criar conta',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: CustomTextField(
                  controller: _usernameController,
                  hintText: 'Nome de Usuário',
                  hintColor: Colors.black,
                  fillColor: const Color(0xff9CD5FF),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: CustomTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  hintColor: Colors.black,
                  fillColor: const Color(0xff9CD5FF),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: CustomTextField(
                  controller: _cepController,
                  hintText: 'CEP',
                  hintColor: Colors.black,
                  fillColor: const Color(0xff9CD5FF),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: CustomTextField(
                  controller: _passwordController,
                  hintText: 'Senha',
                  hintColor: Colors.black,
                  fillColor: const Color(0xff9CD5FF),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: CustomTextField(
                  controller: _confirmPasswordController,
                  hintText: 'Confirmar senha',
                  hintColor: Colors.black,
                  fillColor: const Color(0xff9CD5FF),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _register,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff9181F4),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                  shadowColor: Colors.black26,
                ),
                child: const Text(
                  'Registrar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Já tem conta? Voltar ao login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
