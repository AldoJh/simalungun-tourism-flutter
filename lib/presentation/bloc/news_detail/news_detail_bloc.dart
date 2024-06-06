import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/news_comment_entity.dart';
import 'package:simalungun_tourism/domain/entity/news_detail_entity.dart';
import 'package:simalungun_tourism/domain/usecase/get_newscomment.dart';
import 'package:simalungun_tourism/domain/usecase/get_newsdetail.dart';

part 'news_detail_event.dart';
part 'news_detail_state.dart';

class NewsDetailBloc extends Bloc<NewsDetailEvent, NewsDetailState> {
  GetNewsDetail getNewsDetail;
  GetNewsComment getNewsComment;
  NewsDetailBloc({required this.getNewsDetail, required this.getNewsComment}) : super(NewsDetailInitial()) {
    on<FetchNewsDetailEvent>((event, emit) async {
      emit(NewsDetailLoading());
      final result = await getNewsDetail.call(event.id);
      result.fold(
        (l) => emit(NewsDetailError(message: l)),
        (r) => emit(NewsDetailLoaded(newsDetail: r)),
      );
    });

    on<AddNewsCommentEvent>((event, emit) async {
      final result = await getNewsComment.call(event.newsId, event.content);
      result.fold(
        (l) => emit(NewsDetailError(message: l)),
        (r) => emit(NewsCommentLoaded(newsComment: r)),
      );
    });
  }
}
