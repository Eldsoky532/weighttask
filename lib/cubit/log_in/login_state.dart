part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class SigninLoading extends LoginState {}

class SigninScuess extends LoginState {}

class SigninError extends LoginState {}
