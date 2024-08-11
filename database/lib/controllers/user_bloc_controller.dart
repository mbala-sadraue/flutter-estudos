import 'dart:async';

class UserBloc{
StreamController<int> userSink = StreamController();
UserBloc(){
  userSink.add(0);
}



Stream<int> get userValue => userSink.stream;

void addUser(int value){
  // final soma = userValue + 1;
  userSink.add(value);
  // print();
}





}