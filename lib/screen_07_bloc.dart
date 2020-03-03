import 'package:flutter/material.dart';
import 'package:flutter_basics/bloc/my_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_basics/utils.dart';

class BlocScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Bloc Provider Object
    final CounterBloc _counterBloc = context.bloc<CounterBloc>();

    var _appBar = getAppBar('BLOC Screen');

    // BLOC affected Widget
    var _textBar = BlocBuilder<CounterBloc, int>(
      builder: (context, state) => Text('Counter Value: $state'),
    );

    var _col = Center(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _textBar,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.remove_circle),
                  onPressed: () {
                    _counterBloc.add(CounterEvents.decrement);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.add_circle),
                  onPressed: () {
                    _counterBloc.add(CounterEvents.increment);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );

//    var _body = BlocProvider<CounterBloc>(
//      create: (BuildContext context) => _counterBloc,
//      child: _col,
//    );

    var _body = _col;

    return Scaffold(
      appBar: _appBar,
      body: _body,
    );
  }
}
