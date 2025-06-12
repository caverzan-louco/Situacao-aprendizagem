import 'package:flutter/material.dart';
import 'package:jardim_virtual/controllers/plantas_controller.dart';
import '../models/planta_model.dart';
import '../models/cuidado_model.dart';
import 'add_cuidado_screen.dart';

class PlantaDetalheScreen extends StatelessWidget {
  final Planta planta;
  final CuidadosController controller = CuidadosController();

  PlantaDetalheScreen({required this.planta});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(planta.nome)),
      body: Column(
        children: [
          Text('Espécie: ${planta.especie}'),
          Text('Data de aquisição: ${planta.dataAquisicao}'),
          Text('Local: ${planta.local}'),
          Expanded(
            child: FutureBuilder(
              future: controller.getCuidados(planta.id!),
              builder: (ctx, snapshot) {
                if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
                final cuidados = snapshot.data as List<Cuidado>;
                return ListView.builder(
                  itemCount: cuidados.length,
                  itemBuilder: (ctx, i) => ListTile(
                    title: Text(cuidados[i].tipo),
                    subtitle: Text('${cuidados[i].data}: ${cuidados[i].observacoes}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (ctx) => AddCuidadoScreen(plantaId: planta.id!))),
      ),
    );
  }
}