import 'package:hooks_riverpod/hooks_riverpod.dart';

class CounterNotifier extends StateNotifier<CounterModel>{

  CounterNotifier(): super(_initialValue);
  static const _initialValue = CounterModel(0);

  void increment(){
    state = CounterModel(state.count + 1);
  }
}

class CounterModel{
  final int count;
  const CounterModel(this.count);
}