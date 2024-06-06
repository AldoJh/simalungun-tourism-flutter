part of 'forget_password_bloc.dart';

sealed class ForgetPasswordEvent extends Equatable {
  const ForgetPasswordEvent();

  @override
  List<Object> get props => [];
}

final class ForgetPasswordEventSend extends ForgetPasswordEvent {
  final String email;
  ForgetPasswordEventSend({required this.email});

  @override
  List<Object> get props => [email];
}