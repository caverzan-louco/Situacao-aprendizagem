import 'package:flutter/material.dart';
import 'package:jardim_virtual/controllers/plantas_controller.dart';
import '../models/cuidado_model.dart';

class AddCuidadoScreen extends StatelessWidget {
  final int plantaId;
  final tipoController = TextEditingController();
  final dataController = TextEditingController();
  final observacoesController = TextEditingController();

  AddCuidadoScreen({required this.plantaId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Novo Cuidado')),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(controller: tipoController, decoration: InputDecoration(labelText: 'Tipo (Rega, Adubação, Poda)')),
            TextField(controller: dataController, decoration: InputDecoration(labelText: 'Data')),
            TextField(controller: observacoesController, decoration: InputDecoration(labelText: 'Observações')),
            ElevatedButton(
              child: Text('Salvar'),
              onPressed: () {
                final cuidado = Cuidado(
                  plantaId: plantaId,
                  tipo: tipoController.text,
                  data: dataController.text,
                  observacoes: observacoesController.text,
                );
                CuidadosController().addCuidado(cuidado);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
