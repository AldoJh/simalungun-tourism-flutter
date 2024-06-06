import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/register_entity.dart';
import 'package:simalungun_tourism/domain/usecase/get_register.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  GetRegister getRegister;
  RegisterBloc({required this.getRegister}) : super(RegisterInitial()) {
    on<RegisterButtonEvent>((event, emit) async {
      emit(RegisterLoading());
      final result = await getRegister.call(
          event.name, event.email, event.phone, event.password);
      result.fold(
        (l) {
          emit(RegisterError(message: l));
        },
        (r) => emit(RegisterLoaded(RegisiterUser: r)),
      );
    });
  }
}
