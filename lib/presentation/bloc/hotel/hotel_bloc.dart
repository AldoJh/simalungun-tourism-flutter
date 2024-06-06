import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/hotel_entity.dart';
import 'package:simalungun_tourism/domain/usecase/get_hotel.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  GetHotel getHotel;
  HotelBloc({required this.getHotel}) : super(HotelInitial()) {
    String query = '';
    int page = 1;
    int perPage = 10;
    List<DataEntity> hotels = [];

    on<FetchHotelEvent>((event, emit) async {
      page = 1;
      query = event.query;
      emit(HotelLoading());
      final result = await getHotel.call(query, page, perPage);
      result.fold((l) {
        emit(HotelError(message: l));
      }, (r) {
        hotels = r.data!;
        emit(HotelLoaded(hotels: hotels, meta: r.meta!));
      });
    });

    on<FetchMoreHotelEvent>((event, emit) async {
      page++;
      final result = await getHotel.call(query, page, perPage);
      result.fold((l) {
        emit(HotelError(message: l));
      }, (r) {
        hotels.addAll(r.data!);
        emit(HotelLoaded(hotels: hotels, meta: r.meta!));
      });
    });
  }
}
