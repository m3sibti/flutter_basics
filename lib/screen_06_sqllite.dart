import 'package:flutter/material.dart';
import 'package:flutter_basics/models/Department.dart';
import 'package:flutter_basics/db/DatabaseHelper.dart';
import 'package:flutter_basics/utils.dart';

class SqlLiteScreen extends StatefulWidget {
  @override
  _SqlLiteScreenState createState() => _SqlLiteScreenState();
}

class _SqlLiteScreenState extends State<SqlLiteScreen> {
  List<Department> items = List();
  DatabaseHelper db = DatabaseHelper();

  @override
  void initState() {
    db.getListOfData().then((mList) {
      setState(() {
        mList.forEach((dep) {
          items.add(Department.fromMapObject(dep));
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _appBar = getAppBar('SQL-Lite Screen');
    var _body = SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: ListView.builder(
                  itemCount: items.length,
                  padding: const EdgeInsets.all(8.0),
                  itemBuilder: (context, position) {
                    return Column(
                      children: <Widget>[
                        Divider(height: 5.0),
                        ListTile(
                            title: Text(
                              '${items[position].name}',
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.deepOrangeAccent,
                              ),
                            ),
                            subtitle: Text(
                              '${items[position].subDeps}',
                              style: new TextStyle(
                                fontSize: 18.0,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            leading: CircleAvatar(
                              backgroundColor: Colors.blueAccent,
                              radius: 15.0,
                              child: Text(
                                '${items[position].id}',
                                style: TextStyle(
                                  fontSize: 22.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            trailing: IconButton(
                                icon: const Icon(Icons.remove_circle_outline),
                                onPressed: () => _deleteNote(
                                    context, items[position], position)),
                            onTap:
                                () {} //_navigateToNote(context, items[position]),
                            ),
                      ],
                    );
                  }),
            ),
          ),
          FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                var dep = Department('Sample', 'P Sample', 1, 'Sample Sub');
                _addNote(context, dep);
              }),
        ],
      ),
    );

    return Scaffold(
      appBar: _appBar,
      body: _body,
    );
  }

  void _addNote(BuildContext context, Department dep) async {
    db.saveData(dep).then((i) {
      setState(() {
        //print(dep);
        //Scaffold.of(context).showSnackBar(SnackBar(content: Text('Data added')));
        items.add(dep);
      });
    });
  }

  void _deleteNote(BuildContext context, Department dep, int position) async {
    db.deleteData(dep).then((i) {
      setState(() {
        items.removeAt(position);
      });
    });
  }
}
