import '../database/db_helper.dart';
import '../models/planta_model.dart';
import '../models/cuidado_model.dart';

class PlantasController {
  Future<List<Planta>> getPlantas() => DBHelper.getPlantas();
  Future<void> addPlanta(Planta planta) => DBHelper.insertPlanta(planta);
}

class CuidadosController {
  Future<List<Cuidado>> getCuidados(int plantaId) => DBHelper.getCuidados(plantaId);
  Future<void> addCuidado(Cuidado cuidado) => DBHelper.insertCuidado(cuidado);
}
