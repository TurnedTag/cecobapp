import 'package:flutter/material.dart';

class criarAtividade extends StatelessWidget {
  final List<String> bairrosRioDeJaneiro = [
    'Copacabana',
    'Ipanema',
    'Leblon',
    'Botafogo',
    'Barra da Tijuca',
    // Adicione mais bairros conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF236BBE), // Cor de fundo 236BBE
        appBar: AppBar(
          title: Text('Criar Atividade'), // Título do AppBar
          backgroundColor: Color(0xFF236BBE), // Cor de fundo do AppBar
          elevation: 0, // Remove a sombra do AppBar
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.0),
              TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Título', // Texto antes do campo de texto
                  labelStyle: TextStyle(
                      color:
                          Colors.white), // Cor do texto antes do campo de texto
                  hintText:
                      'Insira o título aqui', // Texto dentro do campo de texto
                  hintStyle: TextStyle(
                      color: Colors
                          .white70), // Cor do texto dentro do campo de texto
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        color: Colors.white), // Cor da borda do campo de texto
                  ),
                  filled: true,
                  fillColor: Color(
                      0xFF236BBE), // Cor de fundo do campo de texto 236BBE
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                style: TextStyle(color: Colors.black),
                maxLines: 3, // Define o número máximo de linhas
                decoration: InputDecoration(
                  labelText: 'Descrição', // Texto antes do campo de texto
                  labelStyle: TextStyle(
                      color:
                          Colors.white), // Cor do texto antes do campo de texto
                  hintText:
                      'Insira a descrição aqui', // Texto dentro do campo de texto
                  hintStyle: TextStyle(
                      color: Colors
                          .white70), // Cor do texto dentro do campo de texto
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        color: Colors.white), // Cor da borda do campo de texto
                  ),
                  filled: true,
                  fillColor: Color(
                      0xFF236BBE), // Cor de fundo do campo de texto 236BBE
                ),
              ),
              SizedBox(height: 20.0),
              DropdownButtonFormField<String>(
                iconSize: 24,
                decoration: InputDecoration(
                  labelText: 'Bairro', // Texto antes do dropdown
                  labelStyle: TextStyle(
                      color: Colors.white), // Cor do texto antes do dropdown
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        color: Colors.white), // Cor da borda do dropdown
                  ),
                  filled: true,
                  fillColor:
                      Color(0xFF236BBE), // Cor de fundo do dropdown 236BBE
                ),
                items: bairrosRioDeJaneiro.map((bairro) {
                  return DropdownMenuItem<String>(
                    value: bairro,
                    child: Text(bairro,
                        style: TextStyle(
                            color: Colors
                                .black)), // Cor do texto dentro do dropdown
                  );
                }).toList(),
                onChanged: (String? value) {},
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 60.0,
                      child: ElevatedButton(
                        onPressed: () {
                          // Ação ao pressionar o botão "Criar Atividade"
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(
                              0xFF3E92CC), // Cor de fundo do botão mais claro
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Borda arredondada do botão
                          ),
                        ),
                        child: Text(
                          'Criar Atividade',
                          style: TextStyle(
                              fontSize: 18.0), // Tamanho do texto do botão
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pop(); // Ação para voltar à tela anterior
                  },
                  icon: Icon(Icons.arrow_back,
                      color: Colors.white, size: 30.0), // Ícone de voltar
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
