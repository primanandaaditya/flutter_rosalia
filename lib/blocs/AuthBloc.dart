import 'dart:async';
import 'package:flutter_rosa/states/LoginState.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_rosa/repo/LoginRepo.dart';
import 'package:flutter_rosa/events/LoginEvent.dart';

class AuthBloc extends Bloc<LoginEvent, LoginState>{

  final LoginRepo loginRepo;

  AuthBloc({@required this.loginRepo})
      : assert(loginRepo != null);

  @override
  LoginState get initialState => LoginUninitialized();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {

    if (event is AppStarted) {
      final bool hasToken = await loginRepo.punyaToken();

      if (hasToken) {
        yield LoginBerhasil();
      } else {
        yield LoginGagal();
      }
    }

    if (event is LoggedIn) {
      yield LoginLoading();
      await loginRepo.pertahankanToken(event.model);
      yield LoginBerhasil();
    }

    if (event is LoggedOut) {
      yield LoginLoading();
      await loginRepo.hapusToken();
      yield LoginGagal();
    }
    
  }



}