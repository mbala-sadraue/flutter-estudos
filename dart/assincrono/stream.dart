import 'dart:async';
/***
 * StreamController -> criar e controla todo processo de stream
 * 
 * sink -> parte de entrada de evento
 * stream -> gerenicar ou transporta os eventos 
 * event -> são dados
 * subscription -> permite-nos ouvir ou receber eventos
 * 
 */


void main(){

  print("Ola stream ");


 
}

void criarStreamBase(){

  var stream = Stream<int>.fromIterable([1,2,3,4,5,6]);
   var subscription = stream.listen(
    (event){

      print("Evento $event");
    },
    onError:(error){
      print("Erro processar o fluxo $error");
    },
    onDone: (){

      print("Processo Finalizado");
    }


  );
  
}