part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonEvent extends LoginEvent {
  final String email;
  final String password;

  LoginButtonEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
