class Pokemon{
  String nome;
  String tipo;
  String nomeImagem;

  Pokemon({this.nome,this.tipo, this.nomeImagem});

  factory Pokemon.fromJson(Map<String, dynamic> json){
    return Pokemon(
      nome:json['nome'],
      tipo:json['tipo'],
      nomeImagem: json['imagem']
    );
  }
}