import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/login_entity.dart';
import 'package:simalungun_tourism/domain/usecase/get_login.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  GetLogin getLogin;
  LoginBloc({required this.getLogin}) : super(LoginInitial()) {
    on<LoginButtonEvent>((event, emit) async {
      emit(LoginLoading());
      final result = await getLogin.call(event.email, event.password);
      result.fold(
        (l) {
          emit(LoginError(message: l));
        },
        (r) {
          emit(LoginLoaded(user: r));
        },
      );
    });
  }
}
