import 'package:flutter/material.dart';
import 'package:ifapp/redux/auth/state_auth.dart';

class LoginPage extends StatelessWidget {
  final AuthState auth;
  final VoidCallback onIncrement;

  LoginPage({
    Key key,
    this.auth,
    this.onIncrement,
  }) : super(key: key);
  // final Store<AuthState> store;
  String p = "sss";
  // LoginPage(this.store);
  // String nameState = name;
  @override
  Widget build(BuildContext context) {
    // if(name!=null)
    //   return FirstScreen();
    print("inlogin ${auth}");
      return Scaffold(
        body: Container(
          color: Colors.white,
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(size: 150),
              SizedBox(height: 50),
              _signInButton(onIncrement),
            ],
          )),
        ),
      );
  }

  Widget _signInButton(Function model) {
    // print(model.onIncrement(2));
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () async => await model(),
      // () async {
      // dynamic sigined = await signInWithGoogle();
      // if(sigined)
      // setState(() {
      //   nameState = name;
      // });
      // },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
