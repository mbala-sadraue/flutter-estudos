import 'dart:async';

import 'contact_event.dart';
import 'contact_state.dart';

class ContactBloc{

  final StreamController<ContactEvent> _inputContactController  = StreamController<ContactEvent>();
  final StreamController<ContactState> _outputContactController = StreamController<ContactState>();

  Sink<ContactEvent> get inputContact {
    return _inputContactController.sink;
  }
  Stream<ContactState> get contactState{
    return _outputContactController.stream;
  }

}

