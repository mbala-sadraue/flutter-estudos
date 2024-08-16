import '../../models/conta.dart';

abstract class ContaEvent {}

class CreateConta extends ContaEvent {
  final Conta conta;
  CreateConta({required this.conta});
}
class UpdateConta extends ContaEvent{
  final Conta conta;
  
  UpdateConta({
    required this.conta
  });
}
class GetConta extends ContaEvent{}

class DeleteConta extends ContaEvent{
  final Conta conta;
  DeleteConta({
      required this.conta
  });
}