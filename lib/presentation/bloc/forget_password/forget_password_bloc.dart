import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/forget_password_entity.dart';
import 'package:simalungun_tourism/domain/usecase/get_forgetpassword.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  GetForgetPassword getForgetPassword;
  ForgetPasswordBloc({required this.getForgetPassword})
      : super(ForgetPasswordInitial()) {
    on<ForgetPasswordEventSend>((event, emit) async {
      emit(ForgetPasswordLoading());
      final result = await getForgetPassword.call(event.email);
      result.fold(
        (l) => emit(ForgetPasswordError(message: l)),
        (r) => emit(ForgetPasswordLoaded(forgetPassword: r)),
      );
    });
  }
}
