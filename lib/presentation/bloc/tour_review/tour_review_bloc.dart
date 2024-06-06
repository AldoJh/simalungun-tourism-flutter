import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/review_entity.dart';
import 'package:simalungun_tourism/domain/entity/tour_review_entity.dart';
import 'package:simalungun_tourism/domain/usecase/get_tourreview.dart';
import 'package:simalungun_tourism/domain/usecase/get_tourreviewadd.dart';

part 'tour_review_event.dart';
part 'tour_review_state.dart';

class TourReviewBloc extends Bloc<TourReviewEvent, TourReviewState> {
  GetTourReview getTourReview;
  GetTourReviewAdd getTourReviewAdd;
  TourReviewBloc({required this.getTourReview, required this.getTourReviewAdd})
      : super(TourReviewInitial()) {
    on<FetchTourReviewEvent>((event, emit) async {
      emit(TourReviewLoading());
      final result = await getTourReview.call(event.id);
      result.fold(
        (l) => emit(TourReviewError(message: l)),
        (r) => emit(TourReviewLoaded(tourReviews: r)),
      );
    });

    on<AddTourReviewEvent>((event, emit) async {
      final result =
          await getTourReviewAdd.call(event.id, event.rating, event.review);
      result.fold((l) => emit(TourReviewError(message: l)), (r) {
        emit(TourReviewAdded(tourReview: r));
      });
    });
  }
}
