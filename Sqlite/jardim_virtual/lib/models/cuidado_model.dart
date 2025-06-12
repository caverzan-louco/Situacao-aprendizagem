class Cuidado {
  int? id;
  int plantaId;
  String tipo;
  String data;
  String observacoes;

  Cuidado({this.id, required this.plantaId, required this.tipo, required this.data, required this.observacoes});

  Map<String, dynamic> toMap() => {
    'id': id,
    'plantaId': plantaId,
    'tipo': tipo,
    'data': data,
    'observacoes': observacoes,
  };
}