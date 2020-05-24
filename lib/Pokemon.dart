class Pokemon{
  String nome;
  String tipo;
  String nomeImagem;
  String descricao;

  Pokemon({this.nome,this.tipo, this.nomeImagem,this.descricao});

  factory Pokemon.fromJson(Map<String, dynamic> json){
    return Pokemon(
      nome:json['nome'],
      tipo:json['tipo'],
      nomeImagem: json['imagem'],
      descricao: json['descricao'].toString(),
    );
  }
}