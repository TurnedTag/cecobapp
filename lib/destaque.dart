import 'package:flutter/material.dart';
import 'package:teste/DestaqueFlamengo.dart';
import 'package:teste/atividade.dart';
import 'package:teste/eventos.dart';
import 'package:teste/melhoria.dart';
import 'package:teste/paginaInicial.dart';

class Destaque extends StatefulWidget {
  Destaque({Key? key}) : super(key: key);

  @override
  _DestaqueState createState() => _DestaqueState();
}

class _DestaqueState extends State<Destaque> {
  final TextEditingController _textController = TextEditingController();
  final dropValue = ValueNotifier("");
  final dropOpcoes = [
    'Abolição',
    'Água Santa',
    'Alto da Boa Vista',
    'Anchieta',
    'Andaraí',
    'Anil',
    'Bancários',
    'Bangu',
    'Barra da Tijuca',
    'Barra de Guaratiba',
    'Barros Filho',
    'Benfica',
    'Bento Ribeiro',
    'Bonsucesso',
    'Botafogo',
    'Braz de Pina',
    'Cachambi',
    'Cacuia',
    'Caju',
    'Campinho',
    'Campo dos Afonsos',
    'Campo Grande',
    'Cascadura',
    'Catete',
    'Catumbi',
    'Cavalcanti',
    'Centro',
    'Cidade de Deus',
    'Cidade Nova',
    'Cocotá',
    'Coelho Neto',
    'Colégio',
    'Copacabana',
    'Cordovil',
    'Cosme Velho',
    'Cosmos',
    'Curicica',
    'Del Castilho',
    'Deodoro',
    'Encantado',
    'Engenho de Dentro',
    'Engenho Novo',
    'Estácio',
    'Flamengo',
    'Freguesia',
    'Gávea',
    'Gardênia Azul',
    'Glória',
    'Grajaú',
    'Grumari',
    'Guadalupe',
    'Guaratiba',
    'Higienópolis',
    'Honório Gurgel',
    'Humaitá',
    'Inhaúma',
    'Inhoaíba',
    'Ipanema',
    'Irajá',
    'Itanhangá',
    'Jacaré',
    'Jacarepaguá',
    'Jardim América',
    'Jardim Botânico',
    'Jardim Carioca',
    'Jardim Guanabara',
    'Jardim Sulacap',
    'Joá',
    'Lagoa',
    'Lapa',
    'Laranjeiras',
    'Largo do Machado',
    'Leblon',
    'Leme',
    'Lins de Vasconcelos',
    'Madureira',
    'Magalhães Bastos',
    'Mangueira',
    'Manguinhos',
    'Maracanã',
    'Marechal Hermes',
    'Maria da Graça',
    'Moneró',
    'Méier',
    'Mogi',
    'Olaria',
    'Oswaldo Cruz',
    'Paciência',
    'Padre Miguel',
    'Paquetá',
    'Parada de Lucas',
    'Pavuna',
    'Pechincha',
    'Pedra de Guaratiba',
    'Penha',
    'Piedade',
    'Pilares',
    'Praça da Bandeira',
    'Praça Seca',
    'Quintino Bocaiúva',
    'Ramos',
    'Realengo',
    'Recreio dos Bandeirantes',
    'Riachuelo',
    'Ribeira',
    'Rio Comprido',
    'Rocha',
    'Rocha Miranda',
    'Rocinha',
    'Sampaio',
    'Santa Cruz',
    'Santa Teresa',
    'Santíssimo',
    'Santo Cristo',
    'São Conrado',
    'São Cristóvão',
    'Tanque',
    'Taquara',
    'Tauá',
    'Tijuca',
    'Todos os Santos',
    'Tomás Coelho',
    'Turiaçu',
    'Urca',
    'Vargem Grande',
    'Vargem Pequena',
    'Vasco da Gama',
    'Vaz Lobo',
    'Vicente de Carvalho',
    'Vidigal',
    'Vigário Geral',
    'Vila Isabel',
    'Vila Kosmos',
    'Vila Militar',
    'Vila Valqueire',
    'Vista Alegre',
    'Zumbi'
  ];

  List<Map<String, dynamic>> _mensagens = [
    {
      "mensagem": "Escola Ort, endereço: Rua Dona Mariana 213, botafogo.",
      "likes": 0
    },
    {
      "mensagem": "Escola Ort, endereço: Rua Dona Mariana 213, botafogo.",
      "likes": 0
    },
    {
      "mensagem": "Escola Ort, endereço: Rua Dona Mariana 213, botafogo.",
      "likes": 0
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF236BBE),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text(
              'CECOB Seu Destaque',
              style: TextStyle(
                color: Color.fromARGB(255, 161, 195, 234),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          controller: _textController,
                          decoration: InputDecoration(
                            hintText: 'Destaque',
                            fillColor: Color(0xff9CD5FF),
                            filled: true,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_rounded),
                        color: Colors.black,
                        iconSize: 40.0,
                        onPressed: () {
                          _exibirMensagem(context, _textController.text);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  SingleChildScrollView(
                    child: ValueListenableBuilder(
                      valueListenable: dropValue,
                      builder: (BuildContext context, String value, _) {
                        return DropdownButton<String>(
                          hint: const Text('Escolha o Bairro'),
                          value: (value.isEmpty) ? null : value,
                          onChanged: (escolha) {
                            dropValue.value = escolha.toString();
                            _avancar(context);
                          },
                          items: dropOpcoes
                              .map((op) => DropdownMenuItem(
                                    value: op,
                                    child: Text(op),
                                  ))
                              .toList(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Container(
              color: Colors.black,
              height: 3,
              width: MediaQuery.of(context)
                  .size
                  .width, // Ajuste de largura conforme a tela
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: _organizarMensagens().map((mensagem) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    mensagem["mensagem"],
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.thumb_up),
                                        onPressed: () {
                                          _likeMessage(
                                              _mensagens.indexOf(mensagem));
                                        },
                                        color: Colors.white,
                                        iconSize: 20.0,
                                      ),
                                      Text(
                                        mensagem["likes"].toString(),
                                        style: TextStyle(
                                          color: Colors.white,
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
                    );
                  }).toList(),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Container(
                    color: Colors.black,
                    height: 80,
                    width: MediaQuery.of(context)
                        .size
                        .width, // Ajuste de largura conforme a tela
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
                                          2), // Reduzi o espaçamento vertical
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
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Eventos()));
                              },
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
            SizedBox(height: 0),
          ],
        ),
      ),
    );
  }

  void _avancar(BuildContext context) {
    String escolha = dropValue.value;

    if (escolha == 'Flamengo') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DestaqueFlamengo()),
      );
    }
  }

  void _exibirMensagem(BuildContext context, String mensagem) {
    setState(() {
      _mensagens.add({"mensagem": mensagem, "likes": 0});
      _mensagens = _organizarMensagens();
    });
  }

  void _likeMessage(int index) {
    setState(() {
      _mensagens[index]["likes"]++;
      _mensagens = _organizarMensagens();
    });
  }

  List<Map<String, dynamic>> _organizarMensagens() {
    _mensagens.sort((a, b) => b["likes"].compareTo(a["likes"]));
    return _mensagens;
  }
}
