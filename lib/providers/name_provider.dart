import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_task/bloc/nameBloc.dart';

class NameProvider extends StateNotifier<NameModel>{
  static const String _fName = 'First Name', _lName = 'Last Name';
  static const _initialUser = NameModel(_fName, _lName);
  NameProvider() : super(_initialUser);

  void userNames(String first, String second){
    // state = CounterModel(state.count + 1);
    state = NameModel(first, second);
  }

}

class NameModel{
  final String fName, lName;
  const NameModel(this.fName, this.lName);
}

class NamingProvider extends StateNotifier{
  String _firstName, _lastName;
  NameBloc _bloc;

  static const String _fNameNaming = 'First Naming', _lNameNaming = 'Last Naming';
  static const _initialUserNaming = NameModel(_fNameNaming, _lNameNaming);

  NamingProvider() : super(_initialUserNaming)
  {
    _bloc = NameBloc();
  }

  // NamingProvider(){
  //   _bloc = NameBloc();
  // }
  String get firstName => _firstName;
  String get lastName => _lastName;
  NameBloc get bloc => _bloc;

  void setFirstName(String first){
    _firstName = first;
    // state =
  }

  void setLastName(String last){
    _lastName = last;
  }
}