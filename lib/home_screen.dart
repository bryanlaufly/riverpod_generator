import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_generator/main.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  void onSubmitName(WidgetRef ref, String value){
    ref.read(userProvider.notifier).updateName(value);
  }

  void onSubmitAge(WidgetRef ref, String value){
    ref.read(userProvider.notifier).updateAge(int.parse(value));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    // final user = ref.watch(userProvider).name; // watch the whole user class and then call its property, name
    // final user = ref.watch(userProvider.select((val) => val.name)); // val refers to the whole object (user class ) but select method is used to watch val.name only 
    print('rebuilt');

    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Column(
        children: [
          TextField(onSubmitted:(value) {
            onSubmitName(ref, value);
          },
          ),

          TextField(onSubmitted:(value) {
            onSubmitAge(ref, value);
          },
          ),
          
          Center(
            child: Text((user.age).toString(),),
            ),
        ],
      ),

    );
  }
}