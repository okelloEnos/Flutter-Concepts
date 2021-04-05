import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_task/counterModel.dart';

final provider = StateNotifierProvider((ref) => CounterNotifier());
void main() {
  runApp(
     const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {

  const MyApp({Key key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {

    print('building MyHomePage');
    // final counterModel = useProvider(provider.state);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            CounterTextWidget(),
            // Text(
            //   '${counterModel.count}',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read(provider).increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class CounterTextWidget extends HookWidget{

  const CounterTextWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('building text widget');
    final countingModel = useProvider(provider.state);

    return Text(
      '${countingModel.count}',
      style: Theme
          .of(context)
          .textTheme
          .headline4,);
  }
}
