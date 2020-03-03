import 'package:flutter/material.dart';
import 'package:flutter_basics/bloc/my_bloc.dart';
import 'package:flutter_basics/utils.dart';
import 'package:flutter_basics/screen_02_listview.dart';
import 'package:flutter_basics/screen_04_sharedprefs.dart';
import 'package:flutter_basics/screen_05_netcon.dart';
import 'package:flutter_basics/screen_06_sqllite.dart';
import 'package:flutter_basics/screen_07_bloc.dart';

class SingleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _mainBody = SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _getButton('ListView Screen', context, ScreenOfListView()),
            SizedBox(height: 10),
            _getButton('Shared Pref Screen', context, SharedPrefScreen()),
            SizedBox(height: 10),
            _getButton('Internet Con. Screen', context, InternetScreen()),
            SizedBox(height: 10),
            _getButton('SQL-Lite Screen', context, SqlLiteScreen()),
            SizedBox(height: 10),
            _getButton('Bloc Screen', context, BlocScreen()),
          ],
        ),
      ),
    );
    var _body = Center(
      child: _mainBody,
    );

    var _scafold = Scaffold(
      appBar: getAppBar('Simple Screen'),
      body: _body,
    );

    return _scafold;
  }
}

_getButton(txt, ctx, dynamicClass) {
  return RaisedButton(
      child: Text(txt),
      onPressed: () => navigateTo(
            ctx,
            dynamicClass,
          ));
}
