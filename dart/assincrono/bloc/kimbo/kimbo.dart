import 'bloc/conta/conta_bloc.dart';
import 'bloc/conta/conta_event.dart';
import 'bloc/conta/conta_state.dart';
import 'models/conta.dart';

void main(){

  final ContaBloc contaBloc = ContaBloc();
  final Conta createConta = Conta(nome: 'mbala', number: '935378674', email:'mbala@gmail.com',);

  contaBloc.contaInput.add(CreateConta(conta: createConta));
  contaBloc.contaState.listen(
    (data){
      if(data is ContaLoading ){
        print("processando....");
      }else if(data is ContaLoaded){

        print("Nome ${data.conta.nome}");
      }else {
        print("Processo não conhecido");
      }
    }
  );
}