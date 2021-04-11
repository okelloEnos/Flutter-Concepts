import 'dart:async';

import 'package:rxdart/rxdart.dart';

class NameBloc{

//  Declare streams
final _firstNameBloc = BehaviorSubject<String>();
final _lastNameBloc = BehaviorSubject<String>();

// Get methods
Stream<String> get firstNameBloc => _firstNameBloc.stream.transform(validateFirstName) ;
Stream<String> get lastNameBloc => _lastNameBloc.stream;
Stream<bool> get nameValid => Rx.combineLatest2(firstNameBloc, lastNameBloc, (a, b) => true);

//set methods
Function(String) get changeFirstName => _firstNameBloc.sink.add;
Function(String) get changeLastName => _lastNameBloc.sink.add;

dispose(){
  _firstNameBloc.close();
  _lastNameBloc.close();
}

//validator
final validateFirstName = StreamTransformer<String, String>.fromHandlers(
  handleData: (fName, sink){
    if(fName.length < 3){
      sink.addError('Minimum of 3 characters');
    }
    else {
      sink.add(fName);
    }
  }
);
}