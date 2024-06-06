import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/tour_guider_entity.dart';
import 'package:simalungun_tourism/domain/usecase/get_tourguide.dart';

part 'tour_guide_event.dart';
part 'tour_guide_state.dart';

class TourGuideBloc extends Bloc<TourGuideEvent, TourGuideState> {
  GetTourGuide gettourGuide;
  TourGuideBloc({required this.gettourGuide}) : super(TourGuideInitial()) {
    on<FetchTourGuideEvent>((event, emit) async {
      emit(TourGuideLoading());
      final result = await gettourGuide.call(event.id);
      result.fold((l) {
        emit(TourGuideError(message: l));
      }, (r) {
        emit(TourGuideLoaded(tourGuides: r));
      });
    });
  }
}
