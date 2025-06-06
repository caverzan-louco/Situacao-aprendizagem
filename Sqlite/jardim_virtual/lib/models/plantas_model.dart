class Planta{
  final int? id;
  final String nome;
  final String especie;
  final String dataAquisicao;
  final String local;

Planta({
  this.id,
  required this.nome,
  required this.especie,
  required this.dataAquisicao,
  required this.local
});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'especie': especie,
      'data_aquisicao': dataAquisicao,
      'local': local
    };
  }

  factory Planta.fromMap(Map<String, dynamic> map) {
    return Planta(
      id: map['id'] as int,
      nome: map['nome'] as String,
      especie: map['especie'] as String,
      dataAquisicao: map['data_aquisicao'] as String,
      local: map['local'] as String,
    );
  }

  @override
  String toString() {
    return 'Planta{id: $id, nome: $nome, especie: $especie, dataAquisicao: $dataAquisicao, local: $local}';
  }
}