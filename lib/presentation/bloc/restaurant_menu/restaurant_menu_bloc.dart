import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/restaurant_menu_entity.dart';
import 'package:simalungun_tourism/domain/usecase/get_restaurantmenu.dart';

part 'restaurant_menu_event.dart';
part 'restaurant_menu_state.dart';

class RestaurantMenuBloc extends Bloc<RestaurantMenuEvent, RestaurantMenuState> {
  GetRestaurantMenu getRestaurantMenu;
  RestaurantMenuBloc({required this.getRestaurantMenu}) : super(RestaurantMenuInitial()) {
    on<FetchRestaurantMenuEvent>((event, emit) async {
      emit(RestaurantMenuLoading());
      final result = await getRestaurantMenu.call(event.id);
      result.fold((l) {
        emit(RestaurantMenuError(message: l));
      }, (r) {
        emit(RestaurantMenuLoaded(restaurantMenu: r));
      });
    });
  }
}
