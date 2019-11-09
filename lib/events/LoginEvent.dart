import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_rosa/models/login/LoginResponseModel.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super();
}

class AppStarted extends LoginEvent {
  @override
  String toString() => 'AppStarted';

  @override
  List<Object> get props => null;
}

class LoggedIn extends LoginEvent {
  final LoginResponseModel model;

  LoggedIn({@required this.model}) : super([model]);

  @override
  String toString() => 'LoggedIn { token: $model }';

  @override
  List<Object> get props => null;
}

class LoggedOut extends LoginEvent {
  @override
  String toString() => 'LoggedOut';

  @override
  List<Object> get props => null;
}