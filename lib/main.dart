import 'package:async_redux/async_redux.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ifapp/redux/auth/state_auth.dart';
import 'package:ifapp/redux/auth/view_model_auth.dart';
import 'package:ifapp/screens/first_screen.dart';

import 'auth/login_page.dart';

// Developed by Marcelo Glasberg (Aug 2019).
// For more info, see: https://pub.dartlang.org/packages/async_redux

Store<AuthState> store;
final auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var user = await _checkLogin();
  var authState =  AuthState(user:user);
  print("biil $user ");
 
  store = Store<AuthState>(initialState: authState);
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) => StoreProvider<AuthState>(
      store: store,
      child: MaterialApp(
        home: MyHomePageConnector(),
      ));
}

class MyHomePageConnector extends StatelessWidget {
  MyHomePageConnector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AuthState, CounterViewModel>(
        model: CounterViewModel(),
        builder: (BuildContext context, CounterViewModel vm) {
          print("vm ${vm.auth.user}");
          if (vm.auth.user == null)
            return LoginPage(
              auth: vm.auth,
              onIncrement: vm.onIncrement,
            );
          return FirstScreen(
            onSignOut: vm.onSignOut,
          );
        });
  }
}
Future<FirebaseUser> _checkLogin() async{
  GoogleSignInAccount user = googleSignIn.currentUser;
  bool login = !(user == null && auth.currentUser == null);
  if(login){
    FirebaseUser currentUser = await auth.currentUser();
        return currentUser;
  }
  else return null;
}
