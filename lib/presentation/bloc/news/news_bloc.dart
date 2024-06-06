import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/news_entity.dart';
import 'package:simalungun_tourism/domain/usecase/get_news.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  GetNews getNews;
  NewsBloc({required this.getNews}) : super(NewsInitial()) {
    int page = 1;
    int perPage = 10;
    String query = '';
    List<DataEntity> news = [];
    on<FetchNewsEvent>((event, emit) async {
      page = 1;
      query = event.query;
      emit(NewsLoading());
      final result = await getNews(query, page, perPage);
      result.fold(
        (l) => emit(NewsError(message: l)),
        (r) {
          news = r.data!;
          emit(NewsLoaded(news: news, meta: r.meta!));
        },
      );
    });

    on<FetchMoreNewsEvent>((event, emit) async {
      page++;
      // emit(NewsLoading());
      final result = await getNews(query, page, perPage);
      result.fold(
        (l) => emit(NewsError(message: l)),
        (r) {
          news.addAll(r.data!);
          emit(NewsLoaded(news: news, meta: r.meta!));
        },
      );
    });
  }
}
