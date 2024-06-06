import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/hotel_review_entity.dart';
import 'package:simalungun_tourism/domain/entity/review_entity.dart';
import 'package:simalungun_tourism/domain/usecase/get_hotelreview.dart';
import 'package:simalungun_tourism/domain/usecase/get_hotelreviewadd.dart';

part 'hotel_review_event.dart';
part 'hotel_review_state.dart';

class HotelReviewBloc extends Bloc<HotelReviewEvent, HotelReviewState> {
  GetHotelReview getHotelReview;
  GetHotelReviewAdd getHotelReviewAdd;
  HotelReviewBloc({required this.getHotelReview, required this.getHotelReviewAdd})
      : super(HotelReviewInitial()) {
    on<FetchHotelReviewEvent>((event, emit) async {
      emit(HotelReviewLoading());
      final result = await getHotelReview.call(event.id);
      result.fold(
        (l) => emit(HotelReviewError(message: l)),
        (r) => emit(HotelReviewLoaded(hotelReview: r)),
      );
    });

    on<AddHotelReviewEvent>((event, emit) async {
      final result = await getHotelReviewAdd.call(event.id, event.rate, event.review);
      result.fold(
        (l) => emit(HotelReviewError(message: l)),
        (r) => emit(HotelReviewAdded(hotelReview: r)),
      );
    });
  }
}
