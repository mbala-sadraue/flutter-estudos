import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CountEvent, int>{

CounterBloc():super(0){
  on<CounterIncrementPressed>(_onIcrementValue);
on<CounterDecrementPressed>(_onDecrementValue);
}
_onIcrementValue( CounterIncrementPressed event, Emitter emit) => emit(state+1);


void _onDecrementValue( CounterDecrementPressed event, Emitter emit){
   if(state > 0) {
    emit(state-1);}
}

}

abstract class CountEvent{}

class CounterIncrementPressed extends CountEvent{}

class CounterDecrementPressed extends CountEvent{}