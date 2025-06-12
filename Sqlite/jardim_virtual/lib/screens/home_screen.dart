import 'package:flutter/material.dart';
import '../controllers/plantas_controller.dart';
import '../models/planta_model.dart';
import 'add_planta_screen.dart';
import 'planta_detalhe_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PlantasController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Minhas Plantas')),
      body: FutureBuilder(
        future: controller.getPlantas(),
        builder: (ctx, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          final plantas = snapshot.data as List<Planta>;
          return ListView.builder(
            itemCount: plantas.length,
            itemBuilder: (ctx, i) => ListTile(
              title: Text(plantas[i].nome),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (ctx) => PlantaDetalheScreen(planta: plantas[i]))),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
  child: Icon(Icons.add),
  onPressed: () async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => AddPlantaScreen()),
    );
    if (result == true) {
      setState(() {}); // Isso faz o FutureBuilder recarregar a lista
    }
  },
),
    );
  }
}