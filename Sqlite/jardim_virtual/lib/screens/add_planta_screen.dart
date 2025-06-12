import 'package:flutter/material.dart';
import '../controllers/plantas_controller.dart';
import '../models/planta_model.dart';

class AddPlantaScreen extends StatefulWidget {
  const AddPlantaScreen({super.key});

  @override
  State<AddPlantaScreen> createState() => _AddPlantaScreenState();
}

class _AddPlantaScreenState extends State<AddPlantaScreen> {
  final nomeController = TextEditingController();
  final especieController = TextEditingController();
  final dataController = TextEditingController();
  final localController = TextEditingController();

  @override
  void dispose() {
    nomeController.dispose();
    especieController.dispose();
    dataController.dispose();
    localController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nova Planta')),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(controller: nomeController, decoration: InputDecoration(labelText: 'Nome')),
            TextField(controller: especieController, decoration: InputDecoration(labelText: 'Espécie')),
            TextField(controller: dataController, decoration: InputDecoration(labelText: 'Data de Aquisição')),
            TextField(controller: localController, decoration: InputDecoration(labelText: 'Local')),
            ElevatedButton(
  child: Text('Salvar'),
  onPressed: () {
    if (nomeController.text.isEmpty ||
        especieController.text.isEmpty ||
        dataController.text.isEmpty ||
        localController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Preencha todos os campos!')),
      );
      return;
    }
    final planta = Planta(
      nome: nomeController.text,
      especie: especieController.text,
      dataAquisicao: dataController.text,
      local: localController.text,
      fotoPath: '', // Sem imagem por enquanto
    );
    PlantasController().addPlanta(planta);
    Navigator.pop(context, true);
  },
)
          ],
        ),
      ),
    );
  }
}