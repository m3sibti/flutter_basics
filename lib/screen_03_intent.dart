import 'package:flutter/material.dart';

class DataPassingScreen extends StatelessWidget {
  final String txt;

  DataPassingScreen(this.txt, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Passing'),
      ),
      body: Container(
        child: Text(this.txt),
      ),
    );
  }
}
