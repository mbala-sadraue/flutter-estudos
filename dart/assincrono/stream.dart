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


void main() async {

  var value = countStream(10);

  print("Ola stream ");
  var result = await sumaStream(value);
  print("Resultado =>  $result");

}

Future<int> sumaStream(Stream<int> stream) async{

int soma = 0;
    // stream.listen(
    //   (value){

    //     print("L - $value");
    //   }
    // );
  await for (final value in stream ){
    soma +=value ; 
  }
  // print("$soma");
  return soma;
}

Stream<int> countStream(int to) async*{


  for (var i = 0; i<= to; i++){
    // print("object -> $i");
    yield i;
  }

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

void criarStreamControllerBasico(){
  var strealController = StreamController();
  var stream = strealController.stream;
  var sink = strealController.sink;

  strealController.add(1);
  sink.add(2);
      
  var subscription = stream.listen(
    (event){
      print("Evento $event");
    }
  );
}