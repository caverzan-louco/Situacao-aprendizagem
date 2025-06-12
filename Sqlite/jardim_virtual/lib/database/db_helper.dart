import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/planta_model.dart';
import '../models/cuidado_model.dart';

class DBHelper {
  static Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'plantcare.db'),
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE plantas(id INTEGER PRIMARY KEY, nome TEXT, especie TEXT, dataAquisicao TEXT, local TEXT, fotoPath TEXT)');
        await db.execute('CREATE TABLE cuidados(id INTEGER PRIMARY KEY, plantaId INTEGER, tipo TEXT, data TEXT, observacoes TEXT)');
      },
      version: 1,
    );
  }

  static Future<int> insertPlanta(Planta planta) async {
    final db = await DBHelper.database();
    return db.insert('plantas', planta.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> insertCuidado(Cuidado cuidado) async {
    final db = await DBHelper.database();
    return db.insert('cuidados', cuidado.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Planta>> getPlantas() async {
    final db = await DBHelper.database();
    final List<Map<String, dynamic>> maps = await db.query('plantas');
    return List.generate(maps.length, (i) => Planta(
      id: maps[i]['id'],
      nome: maps[i]['nome'],
      especie: maps[i]['especie'],
      dataAquisicao: maps[i]['dataAquisicao'],
      local: maps[i]['local'],
      fotoPath: maps[i]['fotoPath'],
    ));
  }

  static Future<List<Cuidado>> getCuidados(int plantaId) async {
    final db = await DBHelper.database();
    final List<Map<String, dynamic>> maps = await db.query('cuidados', where: 'plantaId = ?', whereArgs: [plantaId]);
    return List.generate(maps.length, (i) => Cuidado(
      id: maps[i]['id'],
      plantaId: maps[i]['plantaId'],
      tipo: maps[i]['tipo'],
      data: maps[i]['data'],
      observacoes: maps[i]['observacoes'],
    ));
  }
}