part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginError extends LoginState {
  final String message;

  LoginError({required this.message});

  @override
  List<Object> get props => [message];
}

final class LoginLoaded extends LoginState {
  final LoginEntity? user;

  LoginLoaded({this.user});

  @override
  List<Object> get props => [user!];
}
