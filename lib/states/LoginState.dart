import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];

}

class LoginUninitialized extends LoginState{}
class LoginBerhasil extends LoginState{}
class LoginGagal extends LoginState{}
class LoginLoading extends LoginState{}