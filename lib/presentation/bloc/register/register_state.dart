part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();
  
  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterError extends RegisterState {
  final String message;

  RegisterError({required this.message});

  @override
  List<Object> get props => [message];
}

final class RegisterLoaded extends RegisterState {
  final RegisterEntity? RegisiterUser;

  RegisterLoaded({this.RegisiterUser});

  @override
  List<Object> get props => [RegisiterUser!];
}
