import '../../models/conta.dart';

abstract class ContaState {
  final Conta? conta;
  ContaState({  this.conta});
}

class ContaInitial extends ContaState {
  ContaInitial():super();
}

class ContaLoading extends ContaState{}

class ContaLoaded extends ContaState{
  final Conta conta;
  ContaLoaded({required this.conta}):super(conta: conta);
}
