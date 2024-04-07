import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD9FDFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
          children: [
                        SizedBox(height: 20),

            Container(
              child: Image.asset("assets/logo.png"),
              height: 220,
              width: 220,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Text(
                  'Criar conta', // Adicione a palavra "Login" aqui
                  style: TextStyle(
                    color: Colors
                        .black, 
                    fontSize: 24,
                    fontWeight: FontWeight.bold, 
                  ),
                ),
              ],
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

              SizedBox(height: 20), // Espaço entre o texto "Login" e as caixas de texto
        Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    fillColor: Color(0xff9CD5FF),
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

            SizedBox(height: 20), 
        Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'CEP',
                    fillColor: Color(0xff9CD5FF),
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              SizedBox(height: 20), 
        Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Telefone',
                    fillColor: Color(0xff9CD5FF),
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

            SizedBox(height: 20), 
        Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Senha',
                    fillColor: Color(0xff9CD5FF),
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

            SizedBox(height: 20), 
        Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Confirmar senha',
                    fillColor: Color(0xff9CD5FF),
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                
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

              
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
