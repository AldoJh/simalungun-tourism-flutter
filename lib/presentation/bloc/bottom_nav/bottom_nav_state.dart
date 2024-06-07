part of 'bottom_nav_bloc.dart';

sealed class BottomNavState extends Equatable {
  const BottomNavState();
  
  @override
  List<Object> get props => [];
}

final class BottomNavInitial extends BottomNavState {}

final class BottomNavChanged extends BottomNavState {
  final int index;

  BottomNavChanged(this.index);

  @override
  List<Object> get props => [index];
}


