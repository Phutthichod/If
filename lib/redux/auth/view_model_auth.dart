import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:ifapp/redux/auth/reducer_auth.dart';
import 'package:ifapp/redux/auth/state_auth.dart';
 
class CounterViewModel extends BaseModel<AuthState>{
  CounterViewModel();
  AuthState auth;
  Function onIncrement;
  Function onSignOut;

  CounterViewModel.build({
    @required this.auth,
    @required this.onIncrement,
    @required this.onSignOut,
  }) : super(equals: [auth]);

  @override
  CounterViewModel fromStore() => CounterViewModel.build(
        auth: state,
        onIncrement: () => dispatch(SignIn()),
        onSignOut: () => dispatch(SignOut()),
      );
}