import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/profile_entity.dart';
import 'package:simalungun_tourism/domain/usecase/get_profile.dart';
import 'package:simalungun_tourism/domain/usecase/get_updateprofile.dart';
import 'package:simalungun_tourism/domain/usecase/get_updateprofilepicture.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  GetProfile getProfile;
  GetUpdateProfile getUpdateProfile;
  GetUpdateProfilePicture getUpdateProfilePicture;
  ProfileBloc(
      {required this.getProfile,
      required this.getUpdateProfile,
      required this.getUpdateProfilePicture})
      : super(ProfileInitial()) {
    on<FetchProfileEvent>((event, emit) async {
      emit(ProfileLoading());
      final result = await getProfile.call();
      result.fold(
        (l) => emit(ProfileError(message: l)),
        (r) => emit(ProfileLoaded(profile: r)),
      );
    });

    on<UpdateProfileEvent>((event, emit) async {
      emit(ProfileLoading());
      final result =
          await getUpdateProfile.call(event.name, event.email, event.phone);
      result.fold(
        (l) => emit(ProfileError(message: l)),
        (r) => emit(ProfileUpdated(profile: r)),
      );
    });

    on<UpdateProfilePictureEvent>((event, emit) async {
      log('UpdateProfilePictureEvent');
      emit(ProfileLoading());
      final result = await getUpdateProfilePicture.call(event.image);
      result.fold(
        (l) => emit(ProfileError(message: l)),
        (r) => emit(ProfilePictureUpdated(profile: r)),
      );
    });
  }
}
