import 'package:flutter/material.dart';
import 'package:flutter_basics/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('Shared Prefs'),
      body: SharedPrefWork(),
    );
  }
}

class SharedPrefWork extends StatefulWidget {
  @override
  _SharedPrefWorkState createState() => _SharedPrefWorkState();
}

class _SharedPrefWorkState extends State<SharedPrefWork> {
  String data = '';
  String savedVal = '---';
  var mTxtController = TextEditingController();

  ////////////////////////////////////////////////
  // GET DATA FROM SHARED-PREFERENCES
  @override
  void initState() {
    getNameVal();
    super.initState();
  }

  Future<String> getNamePrefs() async {
    return (await SharedPreferences.getInstance()).getString('name') ??
        'Error While Retriving';
  }

  getNameVal() {
    getNamePrefs().then((sa) {
      setState(() {
        this.savedVal = sa;
      });
    });
  }

  ////////////////////////////////////////////////

  // SAVE NEW DATA IN SHARED-PREFERENCES
  Future<bool> saveNamePrefs(String mData) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.setString('name', mData);
  }

  saveNameVal(mData) {
    saveNamePrefs(mData).then((b) {
      setState(() {
        if (b) {
          this.savedVal = mData;
        } else {
          this.savedVal = 'Some Error While Saving';
        }
      });
    });
  }

  ////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    var EditText = Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        controller: mTxtController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: 'Enter data',
            labelStyle: TextStyle(
              color: Colors.grey,
            ),
            border: OutlineInputBorder()),
        onSubmitted: (str) => this.data = mTxtController.text,
        onChanged: (str2) => this.data = mTxtController.text,
      ),
    );

    _btnPressedFunc() {
      print(this.data);
      saveNameVal(this.data);
    }

    var Btn = RaisedButton(
      child: Text('Save Data'),
      onPressed: _btnPressedFunc,
    );

    return SafeArea(
        child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              child: Column(
                children: <Widget>[
                  EditText,
                  Btn,
                  SizedBox(
                    height: 150.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'SharedPref Data :',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(this.savedVal),
                  ),
                ],
              ),
            )));
  }
}
