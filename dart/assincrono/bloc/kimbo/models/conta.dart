class Conta{

  final String email;
  final String number;
  final String nome; 
  final int? id; 
  const Conta({
    this.id,
    required   this.nome,
    required this.number,
    required this.email
  });
}