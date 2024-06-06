part of 'hotel_bloc.dart';

sealed class HotelEvent extends Equatable {
  const HotelEvent();

  @override
  List<Object> get props => [];
}

class FetchHotelEvent extends HotelEvent {
  final String query;

  FetchHotelEvent({required this.query});

  @override
  List<Object> get props => [query];
}

class FetchMoreHotelEvent extends HotelEvent {
  FetchMoreHotelEvent();

  @override
  List<Object> get props => [];
}
