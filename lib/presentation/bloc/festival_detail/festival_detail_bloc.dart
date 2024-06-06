import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/festival_detail_entity.dart';
import 'package:simalungun_tourism/domain/usecase/get_festivaldetail.dart';

part 'festival_detail_event.dart';
part 'festival_detail_state.dart';

class FestivalDetailBloc extends Bloc<FestivalDetailEvent, FestivalDetailState> {
  GetFestivalDetail getFestivalDetail;
  FestivalDetailBloc({required this.getFestivalDetail}) : super(FestivalDetailInitial()) {
    on<FetchFestivalDetailEvent>((event, emit) async {

      emit(FestivalDetailLoading());
      final result = await getFestivalDetail.call(event.id);
      result.fold(
        (l) => emit(FestivalDetailError(message: l)),
        (r) => emit(FestivalDetailLoaded(festival: r)),
      );
      
    });
  }
}
