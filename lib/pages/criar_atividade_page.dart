import 'package:flutter/material.dart';
import 'package:teste/pages/lista_atividades_page.dart';
import '../components/custom_dropdown.dart';
import '../components/custom_text_field.dart';
import '../components/custom_header.dart';
import '../data/activity_data.dart';
import '../services/activity_service.dart';

class CriarAtividade extends StatefulWidget {
  const CriarAtividade({super.key});

  @override
  _CriarAtividadeState createState() => _CriarAtividadeState();
}

class _CriarAtividadeState extends State<CriarAtividade> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  String? _selectedBairro;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _tituloController.dispose();
    _descricaoController.dispose();
    _streetController.dispose();
    super.dispose();
  }

  void _createActivity() async {
    if (_formKey.currentState?.validate() ?? false) {
      final String title = _tituloController.text;
      final String description = _descricaoController.text;
      final String street = _streetController.text;
      final String? district = _selectedBairro;

      if (district != null) {
        final address = {
          'street': street,
          'district': district,
          'city': 'Rio de Janeiro',
          'state': 'Rio de Janeiro',
          'country': 'Brasil',
        };

        final ActivityService activityService = ActivityService();
        final response =
            await activityService.createActivity(title, description, address);

        if (response != null) {
          Navigator.of(context).pop(true);
        } else {
          // Handle failure (e.g., show an error message)
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF236BBE), // Cor de fundo 236BBE
      appBar: const CustomHeader(title: 'Criar Atividade'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20.0),
              CustomTextField(
                controller: _tituloController,
                hintText: 'Título',
                hintColor: Colors.white70,
                fillColor: const Color(0xFF3E92CC),
              ),
              const SizedBox(height: 20.0),
              CustomTextField(
                controller: _descricaoController,
                hintText: 'Insira a descrição aqui',
                hintColor: Colors.white70,
                fillColor: const Color(0xFF3E92CC),
              ),
              const SizedBox(height: 20.0),
              CustomDropdown(
                hint: 'Escolha o Bairro',
                items: dropOpcoes,
                onChanged: (value) {
                  setState(() {
                    _selectedBairro = value;
                  });
                },
              ),
              const SizedBox(height: 20.0),
              CustomTextField(
                controller: _streetController,
                hintText: 'Insira a rua aqui',
                hintColor: Colors.white70,
                fillColor: const Color(0xFF3E92CC),
              ),
              const SizedBox(height: 20.0),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 60.0,
                      child: ElevatedButton(
                        onPressed: _createActivity,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(
                              0xFF3E92CC), // Cor de fundo do botão mais claro
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Borda arredondada do botão
                          ),
                        ),
                        child: const Text(
                          'Criar Atividade',
                          style: TextStyle(
                            fontSize: 18.0, // Tamanho do texto do botão
                            color: Colors.white, // Cor do texto do botão
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 60.0,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ListaAtividades()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF236BBE),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(
                                color: Colors.white, width: 2.0),
                          ),
                        ),
                        child: const Text(
                          'Voltar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
