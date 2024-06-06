import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/restaurant_entity.dart';
import 'package:simalungun_tourism/domain/usecase/get_restaurant.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  GetRestaurant getRestaurant;
  RestaurantBloc({required this.getRestaurant}) : super(RestaurantInitial()) {
    String query = '';
    int page = 1;
    int perPage = 10;
    List<DatumEntity> restaurants = [];
    on<FetchRestaurantEvent>((event, emit) async {
      emit(RestaurantLoading());
      query = event.query;
      final result = await getRestaurant.call(query, page, perPage);
      result.fold(
        (l) => emit(RestaurantError(message: l)),
        (r) {
          restaurants = r.data!;
          emit(RestaurantLoaded(restaurants: restaurants, meta: r.meta!));
        },
      );
    });

    on<FetchMoreRestaurantEvent>((event, emit) async {
      page++;
      final result = await getRestaurant.call(query, page, perPage);
      result.fold(
        (l) => emit(RestaurantError(message: l)),
        (r) {
          restaurants.addAll(r.data!);
          emit(RestaurantLoaded(restaurants: restaurants, meta: r.meta!));
        },
      );
    });
  }
}
