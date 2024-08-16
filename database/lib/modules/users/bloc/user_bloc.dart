

import 'dart:async';

import 'package:database/database/local/database/user_database.dart';
import 'package:database/models/user.dart';
import 'package:database/modules/users/bloc/user_event.dart';
import 'package:database/modules/users/bloc/user_state.dart';

class UserBloc{


  final StreamController<UserEvent> _inputUserEventController = StreamController<UserEvent>();
  final StreamController<UserState> _outputStateController = StreamController<UserState>();

  Sink<UserEvent> get inputUser  {
    return _inputUserEventController.sink;
  }

  Stream<UserState> get userState{
    return _outputStateController.stream;
  }

  UserBloc(){

    _inputUserEventController.stream.listen(_mapEventToState);
  }


  void _mapEventToState(UserEvent event) async {
    List<User> _users = [];
    _outputStateController.add(UserInitial());


    if(event is UserAdd){

      _users = await UserDatabase.userCreate(event.user);

    }else if( event is UserDelete){

       _users = await  UserDatabase.detele(event.user.id!);
    }else{
      _users = await   UserDatabase.readAll();
    }
    _outputStateController.add(UserLoadSuccess(users: _users));
  }





}