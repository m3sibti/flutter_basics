import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_basics/utils.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter_basics/models/Post.dart';

String API_URL = 'https://jsonplaceholder.typicode.com/posts';

class InternetScreen extends StatefulWidget {
  @override
  _InternetScreenState createState() => _InternetScreenState();
}

class _InternetScreenState extends State<InternetScreen> {
  @override
  Widget build(BuildContext context) {
    var _body = FutureBuilder(
        future: getAllPosts(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('NONE');
            case ConnectionState.waiting:
              return getProgressBar();
              break;
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
            case ConnectionState.done:
              {
                if (snapshot.hasData) {
                  return Column(
                    children: <Widget>[
                      SizedBox(
                        height: 2.0,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height - 60.0,
                        child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (ctx, pos) {
                              var cItem = snapshot.data[pos];

                              return GestureDetector(
                                onTap: () {
                                  Scaffold.of(context).removeCurrentSnackBar();
                                  var _sbar = SnackBar(
                                    content: Text('Post No ${cItem.postId}'),
                                  );
                                  Scaffold.of(context).showSnackBar(_sbar);
                                },
                                child: Center(
                                    child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          child: Text(cItem.postId.toString()),
                                          backgroundColor: Colors.black45,
                                        ),
                                        title: Text(checkTitle(cItem.title)),
                                        subtitle: Text(cItem.body),
                                        trailing: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0)),
                                          child: Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  'U : ${cItem.userId.toString()}'),
                                            ),
                                            color: Colors.yellow,
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      height: 12.0,
                                    ),
                                  ],
                                )),
                              );
                              //getListTileByPos(snapshot.data[pos]);
                            }),
                        //ListView(
                        //children: getListTiles(snapshot.data),
                        //),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return getErrorView(snapshot.error.toString());
                } else {
                  return CircularProgressIndicator();
                }
              }
              break;
          }
          return null;
        });

    return Scaffold(
      appBar: getAppBar('Internet Connectivity'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: _body,
        ),
      ),
    );
  }
}

///////////////////////////////////////
// FETCH DATA FROM INTERNET
Future<Post> getPosts() async {
  final res = await http.get(API_URL);
  if (res.statusCode == 200) {
    return Post.fromJson(jsonDecode(res.body));
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List<Post>> getAllPosts() async {
  final res = await http.get(API_URL);
  //print(res.body);
  var jsonList = await json.decode(res.body);
  //print(jsonList[0]['title']);
  List<Post> mList = List<Post>();
  for (int i = 0; i < jsonList.length; i++) {
    mList.add(Post(
      jsonList[i]['userId'],
      jsonList[i]['id'],
      jsonList[i]['title'],
      jsonList[i]['body'],
    ));
    //print(mList[i].title);
  }
  return mList;
}
/////////////////////////////////////////

////////////////////////////////////////
// CREATE TILES FOR PRESENTING DATA
getListTiles(List<Post> ml) {
  List<Widget> mList = List();
  for (int i = 0; i < ml.length; i++) {
    mList.add(getListTileIC(ml[i]));
  }
  return mList;
}

getListView(List<Post> ml) {
  return ListView.builder(
      itemCount: ml.length,
      itemBuilder: (ctx, pos) {
        return ListTile(
          title: Text(ml[pos].body),
        );
      });
}
///////////////////////////////////////
