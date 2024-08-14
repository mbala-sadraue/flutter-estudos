import 'bloc/conta/conta_bloc.dart';
import 'bloc/conta/conta_event.dart';
import 'models/conta.dart';

void main(){

  final ContaBloc contaBloc = ContaBloc();
  final Conta createConta = Conta(nome: 'mbala', number: '935378674', email:'mbala@gmail.com',);

  contaBloc.contaInput.add(CreateConta(conta: createConta));
}