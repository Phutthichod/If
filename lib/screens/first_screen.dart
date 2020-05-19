import 'package:flutter/material.dart';
import 'package:ifapp/auth/login_page.dart';
import 'package:ifapp/auth/sign_in.dart';

class FirstScreen extends StatelessWidget {
  final VoidCallback onSignOut;
  FirstScreen({
    Key key,
    this.onSignOut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
          ),
          title: Text('Hello IF'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                print('Add');
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: Container(
            child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[Text("15:36 น.")],
            ),
            SizedBox(
              height: 250.0,
            ),
            Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Text("ssss"),
                    Text("sssds"),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("sss")
                  ],
                )),
            SizedBox(
              height: 100.0,
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                        4,
                        (item) => Container(
                            height: 110.0,
                            child: RaisedButton(
                                onPressed: () {}, child: Text("sss")))),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                        4,
                        (item) => Container(
                            height: 110.0,
                            child: RaisedButton(
                                onPressed: () {}, child: Text("sss")))),
                  ),
                )
              ],
            ),
            RaisedButton(
              onPressed: () => this.onSignOut(),
              child: Text("click me"),
            )
          ],
        )));
  }
}
