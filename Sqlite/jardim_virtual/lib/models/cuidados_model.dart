class Cuidados{
  final int id;
  final int plantaId;
  final String rega;
  final String adubacao;
  final String dataCuidado;
  final String observacoes;

Cuidados({
  required this.id,
  required this.plantaId,
  required this.rega,
  required this.adubacao,
  required this.dataCuidado,
  required this.observacoes
});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'planta_id': plantaId,
      'rega': rega,
      'adubacao': adubacao,
      'data_cuidado': dataCuidado,
      'observacoes': observacoes
    };
  }

  factory Cuidados.fromMap(Map<String, dynamic> map) {
    return Cuidados(
      id: map['id'] as int,
      plantaId: map['planta_id'] as int,
      rega: map['rega'] as String,
      adubacao: map['adubacao'] as String,
      dataCuidado: map['data_cuidado'] as String,
      observacoes: map['observacoes'] as String
    );
  }

  @override
  String toString() {
    return 'Cuidados{id: $id, plantaId: $plantaId, rega: $rega, adubacao: $adubacao, dataCuidado: $dataCuidado, observacoes: $observacoes}';
  }
}