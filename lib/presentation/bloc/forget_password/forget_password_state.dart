part of 'forget_password_bloc.dart';

sealed class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();
  
  @override
  List<Object> get props => [];
}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordError extends ForgetPasswordState {
  final String message;
  ForgetPasswordError({required this.message});

  @override
  List<Object> get props => [message];
}

final class ForgetPasswordLoaded extends ForgetPasswordState {
  final ForgetPasswordEntity forgetPassword;
  ForgetPasswordLoaded({required this.forgetPassword});

  @override
  List<Object> get props => [forgetPassword];
}