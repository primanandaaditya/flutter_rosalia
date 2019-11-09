import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rosa/repo/LoginRepo.dart';
import 'package:flutter_rosa/blocs/AuthBloc.dart';
import 'package:flutter_rosa/blocs/DoLoginBloc.dart';

class LoginPage extends StatefulWidget {

  final LoginRepo loginRepo;

  LoginPage({Key key, @required this.loginRepo})
      : assert(loginRepo != null),
        super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  DoLoginBloc _doLoginBloc;
  AuthBloc _authBloc;



  LoginRepo get _loginRepo => widget.loginRepo;
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void initState() {
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _doLoginBloc = DoLoginBloc(
      loginRepo: _loginRepo,
      authBloc: _authBloc,
    );
    super.initState();
  }
}
