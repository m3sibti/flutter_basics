import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_basics/screen_03_intent.dart';

getAppBar(text) {
  return AppBar(
    title: Text(text),
  );
}

getAppBarWIcon(txt, icon) {
  return AppBar(
    title: Text(txt),
    actions: <Widget>[
      ActionChip(
          label: Icon(icon),
          onPressed: () {
            print('Icon Clicked');
          }),
    ],
  );
}

navigateTo(BuildContext ctx, dynamic className) {
  var route = CupertinoPageRoute(builder: (ctx) => className);
//    var route = MyPageRoute(className);
  Navigator.of(ctx).push(route);
}

getListData(ctx) {
  List<Widget> widgets = [];
  for (int i = 0; i < 3; i++) {
    widgets.add(GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ModelItem(Icons.security, "Row $i"),
      ),
      onTap: () {
        var route =
            MaterialPageRoute(builder: (ctx) => DataPassingScreen("Row $i"));
        Navigator.push(ctx, route);
      },
    ));
  }
  return widgets;
}

class ModelItem extends StatelessWidget {
  final IconData i;
  final String text;

  ModelItem(this.i, this.text);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(i),
      title: Text(text),
    );
  }
}

getErrorView(txt) {
  return Text('Error: $txt');
}

getListTileIC(mli) {
  return Center(
    child: Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            child: Text(mli.postId.toString()),
            backgroundColor: Colors.yellow,
          ),
          title: Text(checkTitle(mli.title)),
          subtitle: Text(mli.body),
        ),
      ),
      Divider(
        height: 12.0,
      ),
    ]),
  );
}

checkTitle(x) {
  if (x != null)
    return x.toString().toUpperCase();
  else
    return 'No Data';
}

getProgressBar() {
  return Align(
      alignment: Alignment.center,
      child: Center(child: CircularProgressIndicator()));
}
