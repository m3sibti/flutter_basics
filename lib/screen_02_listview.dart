import 'package:flutter/material.dart';
import 'package:flutter_basics/utils.dart';
import 'package:flutter_basics/screen_03_intent.dart';

class ScreenOfListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _listView = ListView(
      children: getListData(context),
    );
    var _col = Column(
      children: <Widget>[
        Expanded(
          child: _listView,
        )
      ],
    );

    var _pad = Padding(
      padding: EdgeInsets.all(8.0),
      child: _col,
    );
    var _container = Container(
      child: _pad,
    );
    var _center = Center(
      child: _container,
    );
    var _appBar = getAppBarWIcon('ListView Screen', Icons.lock);
    var _scaffold = Scaffold(
      appBar: _appBar,
      body: _center,
    );
    return _scaffold;
  }
}
