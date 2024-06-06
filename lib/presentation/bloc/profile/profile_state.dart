part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
  
  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileError extends ProfileState {
  final String message;

  ProfileError({required this.message});

  @override
  List<Object> get props => [message];
}

final class ProfileLoaded extends ProfileState {
  final ProfileEntity? profile;

  ProfileLoaded({this.profile});

  @override
  List<Object> get props => [profile!];
}

final class ProfileUpdated extends ProfileState {
  final ProfileEntity? profile;

  ProfileUpdated({this.profile});

  @override
  List<Object> get props => [profile!];
}

final class ProfilePictureUpdated extends ProfileState {
  final ProfileEntity? profile;

  ProfilePictureUpdated({this.profile});

  @override
  List<Object> get props => [profile!];
}
