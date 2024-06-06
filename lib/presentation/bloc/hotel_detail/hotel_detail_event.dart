part of 'hotel_detail_bloc.dart';

sealed class HotelDetailEvent extends Equatable {
  const HotelDetailEvent();

  @override
  List<Object> get props => [];
}

final class FetchHotelDetailEvent extends HotelDetailEvent {
  final int id;

  FetchHotelDetailEvent({required this.id});

  @override
  List<Object> get props => [id];
}