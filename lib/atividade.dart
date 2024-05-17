import 'package:flutter/material.dart';
import 'package:teste/DestaqueFlamengo.dart';
import 'package:teste/Destaque.dart';
import 'package:teste/criarAtividade.dart';
import 'package:teste/eventos.dart';
import 'package:teste/melhoria.dart';
import 'package:teste/paginaInicial.dart';
import 'package:teste/pagativdade.dart';

class atividade extends StatefulWidget {
  atividade({Key? key}) : super(key: key);

  @override
  _atividadeState createState() => _atividadeState();
}

class _atividadeState extends State<atividade> {
  final List<String> dropOpcoes = [
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
    {"mensagem": "Limpar praia Botafogo", "likes": 0},
    {"mensagem": "Tapar buracos na Rua Paulo Barreto, Botafogo", "likes": 0},
    {"mensagem": "Limpar praça Radial Sul", "likes": 0},
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
              'CECOB Sua Atividade',
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
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => criarAtividade()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text('Criar Atividade'),
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildDropdownButton(),
                ],
              ),
            ),
            SizedBox(height: 40),
            Container(
              color: Colors.black,
              height: 3,
              width: 1300,
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
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      pagatividade()));
                                        },
                                        child: Text('Entrar na Atividade'),
                                        style: TextButton.styleFrom(
                                          primary: Colors.white,
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
            _buildBottomBar(),
          ],
        ),
      ),
    );
  }

  // Método para construir o DropdownButton
  Widget _buildDropdownButton() {
    String?
        dropdownValue; // Adicionando uma variável para armazenar o valor selecionado

    return SingleChildScrollView(
      child: DropdownButton<String>(
        hint: const Text('Escolha o Bairro'),
        value: dropdownValue, // Definindo o valor inicial como dropdownValue
        onChanged: (escolha) {
          setState(() {
            dropdownValue = escolha; // Atualizando o valor selecionado
          });
          _avancar(context, escolha!);
        },
        items: dropOpcoes
            .map((op) => DropdownMenuItem(
                  value: op,
                  child: Text(op),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: Container(
        color: Colors.black,
        height: 80,
        width: 450,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Destaque()));
                  },
                  icon: Column(
                    children: [
                      Icon(Icons.local_activity,
                          color: Colors.black,
                          size: 20), // Reduzi o tamanho do ícone
                      SizedBox(height: 2), // Reduzi o espaçamento vertical
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
                      borderRadius:
                          BorderRadius.circular(8.0), // Reduzi o raio da borda
                    ),
                    elevation: 2,
                    fixedSize: Size(60, 35), // Reduzi o tamanho do botão
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => melhoria()));
                  },
                  icon: Column(
                    children: [
                      Icon(Icons.trending_up, color: Colors.black, size: 20),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Inicio()));
                  },
                  icon: Column(
                    children: [
                      Icon(Icons.location_city, color: Colors.black, size: 20),
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
                  onPressed: () {},
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
                    fixedSize: Size(60, 35), // Aumentei o tamanho do botão
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Eventos()));
                  },
                  icon: Column(
                    children: [
                      Icon(Icons.event, color: Colors.black, size: 20),
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
    );
  }

  void _avancar(BuildContext context, String escolha) {
    if (escolha == 'Flamengo') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DestaqueFlamengo()),
      );
    }
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
