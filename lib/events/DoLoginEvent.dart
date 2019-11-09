import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_rosa/models/login/LoginRequestModel.dart';

abstract class DoLoginEvent extends Equatable {
  const DoLoginEvent();
}

class DoLoginButtonPressed extends DoLoginEvent {
  final LoginRequestModel loginRequestModel;


  const DoLoginButtonPressed({
    @required this.loginRequestModel
  });

  @override
  List<Object> get props => [loginRequestModel];

  @override
  String toString() =>
      'LoginButtonPressed { username: $loginRequestModel }';
}