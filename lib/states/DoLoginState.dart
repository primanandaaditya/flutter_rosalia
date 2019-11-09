import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class DoLoginState extends Equatable {
  const DoLoginState();

  @override
  List<Object> get props => [];
}

class DoLoginInitial extends DoLoginState {}

class DoLoginLoading extends DoLoginState {}

class DoLoginFailure extends DoLoginState {
  final String error;
  const DoLoginFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}