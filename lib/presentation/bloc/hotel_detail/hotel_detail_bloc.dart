import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/hotel_detail_entity.dart';
import 'package:simalungun_tourism/domain/usecase/get_hoteldetail.dart';

part 'hotel_detail_event.dart';
part 'hotel_detail_state.dart';

class HotelDetailBloc extends Bloc<HotelDetailEvent, HotelDetailState> {
  GetHotelDetail getHotelDetail;
  HotelDetailBloc({required this.getHotelDetail})
      : super(HotelDetailInitial()) {
    on<FetchHotelDetailEvent>((event, emit) async {
      emit(HotelDetailLoading());
      final result = await getHotelDetail.call(event.id);
      result.fold(
        (l) => emit(HotelDetailError(message: l)),
        (r) => emit(HotelDetailLoaded(hotelDetail: r)),
      );
    });
  }
}
