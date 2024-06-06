import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/tour_entity.dart';
import 'package:simalungun_tourism/domain/usecase/get_tour.dart';

part 'tour_event.dart';
part 'tour_state.dart';

class TourBloc extends Bloc<TourEvent, TourState> {
  GetTour getTour;
  TourBloc({required this.getTour}) : super(TourInitial()) {
    List<DatumEntity> tours = [];
    int page = 1;
    int perPage = 10;
    String query = '';

    on<FetchTourEvent>((event, emit) async {
      page = 1;
      emit(TourLoading());
      log('fetch more tour $page, tours: ${tours.length}');

      query = event.query;
      final result = await getTour(query, page, perPage);
      result.fold(
        (l) => emit(TourError(message: l)),
        (r) {
          tours = r.data!;
          emit(TourLoaded(tours: tours, meta: r.meta!));
        },
      );
    });

    on<FetchMoreTourEvent>((event, emit) async {
      page++;
      log('fetch more tour $page, tours: ${tours.length}');
      final result = await getTour(query, page, perPage);
      result.fold(
        (l) => emit(TourError(message: l)),
        (r) {
          tours.addAll(r.data!);
          emit(TourLoaded(tours: tours, meta: r.meta!));
        },
      );
    });
  }
}
