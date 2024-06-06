part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class FetchProfileEvent extends ProfileEvent {
  FetchProfileEvent();

  @override
  List<Object> get props => [];
}

class UpdateProfileEvent extends ProfileEvent {
  final String name;
  final String email;
  final String phone;
  UpdateProfileEvent({required this.name, required this.email, required this.phone});

  @override
  List<Object> get props => [name, email, phone];
}

class UpdateProfilePictureEvent extends ProfileEvent {
  final File image;
  UpdateProfilePictureEvent({required this.image});

  @override
  List<Object> get props => [image];
}

class UpdatePasswordEvent extends ProfileEvent {
  final String newPassword;
  UpdatePasswordEvent({ required this.newPassword});

  @override
  List<Object> get props => [ newPassword];
}


