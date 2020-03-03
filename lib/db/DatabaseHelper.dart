import 'package:flutter_basics/models/Department.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database _db;

  DatabaseHelper.internal();

  String tblName = DepContract.tblName;

  //All Other Columns are in DepContract

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  // Initialize Database
  Future<Database> initializeDb() async {
    var dbPath = await getDatabasesPath();
    var path = join(dbPath + DepContract.DbName);
    var mDB = await openDatabase(path, version: 1, onCreate: _createDb);
    return mDB;
  }

  // create the table in database
  void _createDb(Database db, int newVersion) async {
    var sqlQuery = 'CREATE TABLE $tblName ('
        '${DepContract.colId} INTEGER PRIMARY KEY AUTOINCREMENT,'
        ' ${DepContract.colName} TEXT, '
        '${DepContract.colPresidentName} TEXT, '
        '${DepContract.colNoOfStds} INTEGER, '
        '${DepContract.colSubDeps} TEXT '
        ')';

    await db.execute(sqlQuery);
  }

  //CREATE
  Future<int> saveData(Department dep) async {
    Database dbClient = await db;
    var res = await dbClient.insert(tblName, dep.toMap());
    return res;
  }

  //READ
  Future<List> getListOfData() async {
    Database dbClient = await db;

    ///Check differences btw Raw and Helper functions
    //var res = await db.rawQuery('WRITE WHOLE QUERY HERE');
    var res =
        await dbClient.query(tblName, orderBy: '${DepContract.colName} ASC');
    return res.toList();
  }

  //UPDATE
  Future<int> updateData(Department dep) async {
    Database db = await this.db;
    var res = await db.update(tblName, dep.toMap(),
        where: '${DepContract.colId} = ?', whereArgs: [dep.id]);
    return res;
  }

  //DELETE
  Future<int> deleteData(Department dep) async {
    Database db = await this.db;
    var res = await db.delete(tblName,
        where: '${DepContract.colId} = ?', whereArgs: [dep.id]);
    return res;
  }

  //GET COUNT
  Future<int> getCount() async {
    Database db = await this.db;
    var res = await db.rawQuery('Select count(*) from $tblName');
    int x = Sqflite.firstIntValue(res);
    return x;
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }

  ///Create List of Departments
  Future<List<Department>> getDepList() async {
    var res = await getListOfData();
    List<Department> mList = List<Department>();
    for (int i = 0; i < mList.length; i++) {
      mList.add(Department.fromMapObject(res[i]));
    }
    return mList;
  }
}
