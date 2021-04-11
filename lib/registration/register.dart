import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_task/providers/name_provider.dart';

final nameBasedProvider = StateNotifierProvider((ref) => NameProvider());
final namingProvider = StateNotifierProvider((ref) => NamingProvider());

class Register extends HookWidget {
  // final registerDetails = useProvider(nameBasedProvider.state);
  // final TextEditingController firstController = TextEditingController();
  // final TextEditingController secondController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final registerDetails = useProvider(nameBasedProvider.state);
    final namingBloc = useProvider(namingProvider).bloc;
    print('Oketch ::: ${useProvider(namingProvider).lastName}');
    final firstController = TextEditingController();
    final secondController = TextEditingController();

    if(useProvider(namingProvider).firstName != null){
      firstController.text = useProvider(namingProvider).firstName;
      namingBloc.changeFirstName(useProvider(namingProvider).firstName);
    }

    if(useProvider(namingProvider).lastName != null){
      secondController.text = useProvider(namingProvider).lastName;
      namingBloc.changeLastName(useProvider(namingProvider).lastName);
    }
    // final triko = useProvider(namingProvider.state);

    return Scaffold(
      appBar: AppBar(
        title: Text('User Input'),
      ),
      body: Padding(padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          StreamBuilder<String>(
            stream: namingBloc.firstNameBloc,
            builder: (context, snapshot) {
              return TextField(
                controller: firstController,
                decoration: InputDecoration(labelText: 'First Name', errorText: snapshot.error),
              onChanged: namingBloc.changeFirstName,);
            }
          ),
          StreamBuilder<String>(
            stream: namingBloc.lastNameBloc,
            builder: (context, snapshot) {
              return TextField(
                controller: secondController,
                decoration: InputDecoration(labelText: 'Last Name'),
              onChanged: namingBloc.changeLastName,);
            }
          ),
          StreamBuilder<bool>(
            stream: namingBloc.nameValid,
            builder: (context, snapshot) {
              return RaisedButton(
                child: Text('Save '),
                  onPressed: !snapshot.hasData ? null : (){
                  context.read(nameBasedProvider).userNames(firstController.text, secondController.text);
                  context.read(namingProvider).setFirstName(firstController.text);
                  context.read(namingProvider).setLastName(secondController.text);
                  print('f name : ${registerDetails.fName}  ::: second name : ${registerDetails.lName}');
                  print('f naming : ${context.read(namingProvider).firstName}  ::: second naming : ${context.read(namingProvider).lastName}');

                  Navigator.pop(context);
              });
            }
          )
        ],
      ),),
    );
  }
}
