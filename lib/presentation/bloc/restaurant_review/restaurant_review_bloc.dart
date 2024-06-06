import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/restaurant_review_entity.dart';
import 'package:simalungun_tourism/domain/entity/review_entity.dart';
import 'package:simalungun_tourism/domain/usecase/get_restaurantreview.dart';
import 'package:simalungun_tourism/domain/usecase/get_restaurantreviewadd.dart';

part 'restaurant_review_event.dart';
part 'restaurant_review_state.dart';

class RestaurantReviewBloc extends Bloc<RestaurantReviewEvent, RestaurantReviewState> {
  GetRestaurantReview getRestaurantReview;
  GetRestaurantReviewAdd getRestaurantReviewAdd;
  RestaurantReviewBloc({required this.getRestaurantReview, required this.getRestaurantReviewAdd}) : super(RestaurantReviewInitial()) {
    on<FetchRestaurantReviewEvent>((event, emit) async  {
      emit(RestaurantReviewLoading());
      final result = await getRestaurantReview.call(event.id);
      result.fold(
        (l) => emit(RestaurantReviewError(message: l)),
        (r) => emit(RestaurantReviewLoaded(restaurantReview: r)),
      );
    });
    on<AddRestaurantReviewEvent>((event, emit) async {
      final result = await getRestaurantReviewAdd.call(event.id, event.rate, event.review);
      result.fold(
        (l) => emit(RestaurantReviewError(message: l)),
        (r) => emit(RestaurantReviewAdded(restaurantReview: r)),
      );
    });
  }
}
