class Planta {
  int? id;
  String nome;
  String especie;
  String dataAquisicao;
  String local;
  String fotoPath;

  Planta({this.id, required this.nome, required this.especie, required this.dataAquisicao, required this.local, required this.fotoPath});

  Map<String, dynamic> toMap() => {
    'id': id,
    'nome': nome,
    'especie': especie,
    'dataAquisicao': dataAquisicao,
    'local': local,
    'fotoPath': fotoPath,
  };
}