import 'package:flutter/material.dart';

class pagatividade extends StatefulWidget {
  pagatividade({Key? key}) : super(key: key);

  @override
  _pagatividadeState createState() => _pagatividadeState();
}

class _pagatividadeState extends State<pagatividade> {
  int _presencaCount = 0;
  TextEditingController _messageController = TextEditingController();
  List<String> _messages = [];

  void _aumentarPresenca() {
    setState(() {
      _presencaCount++;
    });
  }

  void _sendMessage() {
    setState(() {
      _messages.add(_messageController.text);
      _messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Círculo com a imagem
          Container(
            width: 200, // Tamanho do círculo
            height: 200, // Tamanho do círculo
            margin: EdgeInsets.only(top: 80), // Margem superior
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white, // Cor de fundo do círculo
            ),
            child: CircleAvatar(
              radius: 200, // Tamanho do círculo avatar
            ),
          ),
          // Espaço para descrição
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Descrição',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          // Linha divisória
          Container(
            height: 3.0,
            width: double.infinity,
            color: Colors.black,
          ),
          // Botão "Marcar Presença"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _aumentarPresenca();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: Text('Marcar Presença'),
                  ),
                ),
                SizedBox(width: 10), // Espaçamento entre os botões
                ElevatedButton(
                  onPressed: () {
                    _aumentarPresenca();
                  },
                  child: Text(_presencaCount.toString()),
                ),
              ],
            ),
          ),
          // Novo TextField para enviar mensagens
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Digite uma mensagem...',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Espaçamento entre o TextField e o botão
                ElevatedButton(
                  onPressed: () {
                    _sendMessage();
                  },
                  child: Text('Enviar'),
                ),
              ],
            ),
          ),
          // Mensagens enviadas
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.black,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _messages[index],
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ),
          // Botão de retorno
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFF236BBE), // Cor de fundo #236BBE
    );
  }
}
