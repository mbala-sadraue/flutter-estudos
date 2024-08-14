import '../models/conta.dart';

class ContaRepository{
 late final  Conta _conta;
final int seconds  = 3;
 Future<Conta> get getConta async {
  return Future.delayed(
    Duration(seconds: seconds ),
     () => _conta
  );
 }

 Future<Conta> createConta (Conta conta) {
  _conta = conta;
  return Future.delayed(
    Duration(seconds: seconds ),
     () => _conta
  );
 }
 Future<Conta>  deleteConta (Conta conta) {

  return Future.delayed(
    Duration(seconds: seconds ),
     () => _conta
  );
 }
}