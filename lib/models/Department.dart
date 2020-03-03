class DepContract {
  static String DbName = 'depDB.db';
  static String tblName = 'Departments';

  static String colId = '_id';
  static String colName = 'name';
  static String colPresidentName = 'p_name';
  static String colNoOfStds = 'std_nums';
  static String colSubDeps = 'sub_deps';
}

class Department {
  //Data Members
  int _id;
  String _name;
  String _presidentName;
  int _noOfStudents;
  String _subDeps;

  //Constructors
  Department(
      this._name, this._presidentName, this._noOfStudents, this._subDeps);

  Department.withId(this._id, this._name, this._presidentName,
      this._noOfStudents, this._subDeps);

  //Getters
  int get id => this._id;

  String get name => this._name;

  String get president => this._presidentName;

  int get noOfStudent => this._noOfStudents;

  String get subDeps => this._subDeps;

  //Setter
  set name(String str) {
    if (str.length != 0) {
      this._name = str;
    }
  }

  ///Convert Your data into a map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> m = Map<String, dynamic>();
    if (this.id != null) {
      m[DepContract.colId] = this._id;
    }
    m[DepContract.colName] = this._name;
    m[DepContract.colPresidentName] = this._presidentName;
    m[DepContract.colNoOfStds] = this._noOfStudents;
    m[DepContract.colSubDeps] = this._subDeps;

    return m;
  }

  ///Extract Data From Map Object
  Department.fromMapObject(Map<String, dynamic> map) {
    this._id = map[DepContract.colId];
    this._name = map[DepContract.colName];
    this._presidentName = map[DepContract.colPresidentName];
    this._noOfStudents = map[DepContract.colNoOfStds];
    this._subDeps = map[DepContract.colSubDeps];
  }
}
