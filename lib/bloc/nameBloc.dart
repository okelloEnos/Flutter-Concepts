import 'package:rxdart/rxdart.dart';

class NameBloc{

//  Declare streams
final _firstNameBloc = BehaviorSubject<String>();
final _lastNameBloc = BehaviorSubject<String>();

// Get methods
Stream<String> get firstNameBloc => _firstNameBloc.stream;
Stream<String> get lastNameBloc => _lastNameBloc.stream;

//set methods
Function(String) get changeFirstName => _firstNameBloc.sink.add;
Function(String) get changeLastName => _lastNameBloc.sink.add;

dispose(){
  _firstNameBloc.close();
  _lastNameBloc.close();
}
}