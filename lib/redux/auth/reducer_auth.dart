import 'package:async_redux/async_redux.dart';
import 'package:ifapp/auth/sign_in.dart';

import 'state_auth.dart';
 class SignIn extends ReduxAction<AuthState> {


  @override
  Future<AuthState> reduce() async{
    print("user seach");
     dynamic user = await signInWithGoogle();
     print("user ready");
     return AuthState(user:user);

  }
 

 }
 class SignOut extends ReduxAction<AuthState> {


  @override
  Future<AuthState> reduce() async{
    print("user logout");
     signOutGoogle();
     return AuthState(user:null);

  }
 

 }
  class IncrementAction extends ReduxAction<int> {
   int amount;

  IncrementAction(amount){
    // print(amount);
    this.amount = amount;
  } 

  @override
  int reduce(){
    int t = state;
    t+=amount;
    print("$t");
    return t;
  }

}
