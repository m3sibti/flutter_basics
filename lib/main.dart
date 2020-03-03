import 'package:flutter_basics/screen_01_simple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/bloc/my_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (_) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Basics',
        home: SingleScreen(),
        theme: ThemeData(primarySwatch: Colors.red, primaryColor: Colors.blue),
//        child: CounterPage(),
      ),
    );
  }
}
