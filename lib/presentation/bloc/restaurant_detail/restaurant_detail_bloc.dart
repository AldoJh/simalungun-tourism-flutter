import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/restaurant_detail_entity.dart';
import 'package:simalungun_tourism/domain/usecase/get_restaurantdetail.dart';

part 'restaurant_detail_event.dart';
part 'restaurant_detail_state.dart';

class RestaurantDetailBloc
    extends Bloc<RestaurantDetailEvent, RestaurantDetailState> {
  GetRestaurantDetail getRestaurantDetail;
  RestaurantDetailBloc({required this.getRestaurantDetail})
      : super(RestaurantDetailInitial()) {
    on<FetchRestaurantDetailEvent>((event, emit) async {
      emit(RestaurantDetailLoading());
      final result = await getRestaurantDetail.call(event.id);
      result.fold(
        (l) => emit(RestaurantDetailError(message: l)),
        (r) => emit(RestaurantDetailLoaded(restaurant: r)),
      );
    });
  }
}
