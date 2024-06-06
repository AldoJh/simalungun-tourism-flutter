part of 'hotel_detail_bloc.dart';

sealed class HotelDetailState extends Equatable {
  const HotelDetailState();
  
  @override
  List<Object> get props => [];
}

final class HotelDetailInitial extends HotelDetailState {}

final class HotelDetailLoading extends HotelDetailState {}

final class HotelDetailLoaded extends HotelDetailState {
  final HotelDetailEntity hotelDetail;

  const HotelDetailLoaded({required this.hotelDetail});

  @override
  List<Object> get props => [hotelDetail];
}

final class HotelDetailError extends HotelDetailState {
  final String message;

  const HotelDetailError({required this.message});

  @override
  List<Object> get props => [message];
}
