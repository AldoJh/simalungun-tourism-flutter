import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/festival_entity.dart';
import 'package:simalungun_tourism/domain/usecase/get_festival.dart';

part 'festival_event.dart';
part 'festival_state.dart';

class FestivalBloc extends Bloc<FestivalEvent, FestivalState> {
  GetFestival getFestival;
  FestivalBloc({required this.getFestival}) : super(FestivalInitial()) {
    int page = 1;
    int perPage = 10;
    String query = '';
    List<DataEntity> festival = [];
    on<FetchFestivalEvent>((event, emit) async {
      page = 1;
      query = event.query;
      emit(FestivalLoading());
      final result = await getFestival.call(query, page, perPage);
      result.fold(
        (l) => emit(FestivalError(message: l)),
        (r) {
          festival = r.data!;
          emit(FestivalLoaded(festival: festival, meta: r.meta!));
        },
      );
    });

    on<fetchMoreFestivalEvent>((event, emit) async {
      page++;
      // emit(FestivalLoading());
      final result = await getFestival.call(query, page, perPage);
      result.fold(
        (l) => emit(FestivalError(message: l)),
        (r) {
          festival.addAll(r.data!);
          emit(FestivalLoaded(festival: festival, meta: r.meta!));
        },
      );
    });
  }
}
