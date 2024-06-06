import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/tour_detail_entity.dart';
import 'package:simalungun_tourism/domain/usecase/get_tourdetail.dart';

part 'tour_detail_event.dart';
part 'tour_detail_state.dart';

class TourDetailBloc extends Bloc<TourDetailEvent, TourDetailState> {
  GetTourDetail getTourDetail;
  TourDetailBloc({required this.getTourDetail}) : super(TourDetailInitial()) {
    on<FetchTourDetailEvent>((event, emit) async {
      emit(TourDetailLoading());
      final result = await getTourDetail(event.id);
      result.fold(
        (l) => emit(TourDetailError(message: l)),
        (r) => emit(TourDetailLoaded(tourDetail: r)),
      );
    });
  }
}
