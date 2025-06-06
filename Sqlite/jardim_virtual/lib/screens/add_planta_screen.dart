//formulário para adicionar nova planta
import 'package:flutter/material.dart';
import 'package:jardim_virtual/models/planta_model.dart';
import 'package:jardim_virtual/database/db_helper.dart';
import 'package:jardim_virtual/screens/home_screen.dart';
import 'package:intl/intl.dart';

class AddPlantaScreen extends StatefulWidget {
  @override
  _AddPlantaScreenState createState() => _AddPlantaScreenState();
}

class _AddPlantaScreenState extands State<AddPlantaScreen> {
   
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();

  late String _nome;
  String _especie = "";
  String _dataAquisicao = "";
  String _local = "";

  Future<void> _salvarPlanta() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newPlanta = Planta(
        nome: _nome,
        especie: _especie,
        dataAquisicao: _dataAquisicao,
        local: _local,
      );

      try {
        
      }
    }
  }
}


