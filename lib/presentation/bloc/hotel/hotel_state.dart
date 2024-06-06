part of 'hotel_bloc.dart';

sealed class HotelState extends Equatable {
  const HotelState();
  
  @override
  List<Object> get props => [];
}

final class HotelInitial extends HotelState {}

final class HotelLoading extends HotelState {}

final class HotelLoaded extends HotelState {
  final List<DataEntity> hotels;
  final MetaEntity meta;

  HotelLoaded({required this.hotels, required this.meta});

  @override
  List<Object> get props => [hotels, meta];
}

final class HotelError extends HotelState {
  final String message;

  HotelError({required this.message});

  @override
  List<Object> get props => [message];
}
