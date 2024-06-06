import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:simalungun_tourism/data/datasource/remote/remote_datasource_impl.dart';
import 'package:simalungun_tourism/data/datasource/remote_datasource.dart';
import 'package:simalungun_tourism/data/repositories/repository_domain_impl.dart';
import 'package:simalungun_tourism/domain/repositories/repository_domain.dart';
import 'package:simalungun_tourism/domain/usecase/get_festival.dart';
import 'package:simalungun_tourism/domain/usecase/get_festivaldetail.dart';
import 'package:simalungun_tourism/domain/usecase/get_forgetpassword.dart';
import 'package:simalungun_tourism/domain/usecase/get_hotel.dart';
import 'package:simalungun_tourism/domain/usecase/get_hoteldetail.dart';
import 'package:simalungun_tourism/domain/usecase/get_hotelreview.dart';
import 'package:simalungun_tourism/domain/usecase/get_hotelreviewadd.dart';
import 'package:simalungun_tourism/domain/usecase/get_login.dart';
import 'package:simalungun_tourism/domain/usecase/get_news.dart';
import 'package:simalungun_tourism/domain/usecase/get_newscomment.dart';
import 'package:simalungun_tourism/domain/usecase/get_newsdetail.dart';
import 'package:simalungun_tourism/domain/usecase/get_profile.dart';
import 'package:simalungun_tourism/domain/usecase/get_register.dart';
import 'package:simalungun_tourism/domain/usecase/get_restaurant.dart';
import 'package:simalungun_tourism/domain/usecase/get_restaurantdetail.dart';
import 'package:simalungun_tourism/domain/usecase/get_restaurantmenu.dart';
import 'package:simalungun_tourism/domain/usecase/get_restaurantreview.dart';
import 'package:simalungun_tourism/domain/usecase/get_restaurantreviewadd.dart';
import 'package:simalungun_tourism/domain/usecase/get_tour.dart';
import 'package:simalungun_tourism/domain/usecase/get_tourdetail.dart';
import 'package:simalungun_tourism/domain/usecase/get_tourguide.dart';
import 'package:simalungun_tourism/domain/usecase/get_tourreview.dart';
import 'package:simalungun_tourism/domain/usecase/get_tourreviewadd.dart';
import 'package:simalungun_tourism/domain/usecase/get_updateprofile.dart';
import 'package:simalungun_tourism/domain/usecase/get_updateprofilepassword.dart';
import 'package:simalungun_tourism/domain/usecase/get_updateprofilepicture.dart';
import 'package:simalungun_tourism/presentation/bloc/festival/festival_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/festival_detail/festival_detail_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/forget_password/forget_password_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/hotel/hotel_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/hotel_detail/hotel_detail_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/hotel_review/hotel_review_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/login/login_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/news/news_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/news_detail/news_detail_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/profile/profile_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/register/register_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/restaurant/restaurant_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/restaurant_detail/restaurant_detail_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/restaurant_menu/restaurant_menu_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/restaurant_review/restaurant_review_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/tour/tour_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/tour_detail/tour_detail_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/tour_guide/tour_guide_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/tour_review/tour_review_bloc.dart';

final getIt = GetIt.instance;

void init() {
  // Bloc
  getIt.registerFactory(() => LoginBloc(getLogin: getIt()));
  getIt.registerFactory(() => RegisterBloc(getRegister: getIt()));
  getIt.registerFactory(() => ForgetPasswordBloc(getForgetPassword: getIt()));
  getIt.registerFactory(() => ProfileBloc(getProfile: getIt(), getUpdateProfile: getIt(), getUpdateProfilePicture: getIt() ));
  getIt.registerFactory(() => NewsBloc(getNews: getIt()));
  getIt.registerFactory(() => NewsDetailBloc(getNewsDetail: getIt(), getNewsComment: getIt()));
  getIt.registerFactory(() => FestivalBloc(getFestival: getIt()));
  getIt.registerFactory(() => FestivalDetailBloc(getFestivalDetail: getIt()));
  getIt.registerFactory(() => TourBloc(getTour: getIt()));
  getIt.registerFactory(() => TourDetailBloc(getTourDetail: getIt()));
  getIt.registerFactory(
      () => TourReviewBloc(getTourReviewAdd: getIt(), getTourReview: getIt()));
  getIt.registerFactory(() => TourGuideBloc(gettourGuide: getIt()));
  getIt.registerFactory(() => HotelBloc(getHotel: getIt()));
  getIt.registerFactory(() =>
      HotelReviewBloc(getHotelReview: getIt(), getHotelReviewAdd: getIt()));
  getIt.registerFactory(() => HotelDetailBloc(getHotelDetail: getIt()));
  getIt.registerFactory(() => RestaurantBloc(getRestaurant: getIt()));
  getIt.registerFactory(
      () => RestaurantDetailBloc(getRestaurantDetail: getIt()));
  getIt.registerFactory(() => RestaurantReviewBloc(
      getRestaurantReview: getIt(), getRestaurantReviewAdd: getIt()));
  getIt.registerFactory(() => RestaurantMenuBloc(getRestaurantMenu: getIt()));

  // Use cases
  getIt.registerLazySingleton(() => GetLogin(repositoryDomain: getIt()));
  getIt.registerLazySingleton(() => GetRegister(repositoryDomain: getIt()));
  getIt.registerLazySingleton(() => GetForgetPassword(repositoryDomain: getIt()));
  getIt.registerLazySingleton(() => GetProfile(repositoryDomain: getIt()));
  getIt.registerLazySingleton(() => GetUpdateProfile(repositoryDomain: getIt()));
  getIt.registerLazySingleton(() => GetUpdateProfilePassword(repositoryDomain: getIt()));
  getIt.registerLazySingleton(() => GetUpdateProfilePicture(repositoryDomain: getIt()));
  getIt.registerLazySingleton(() => GetNews(getIt()));
  getIt.registerLazySingleton(() => GetNewsComment(repositoryDomain: getIt()));
  getIt.registerLazySingleton(() => GetNewsDetail(repositoryDomain: getIt()));
  getIt.registerLazySingleton(() => GetFestival(repositoryDomain: getIt()));
  getIt.registerLazySingleton(
      () => GetFestivalDetail(repositoryDomain: getIt()));
  getIt.registerLazySingleton(() => GetRestaurant(repositoryDomain: getIt()));
  getIt.registerLazySingleton(
      () => GetRestaurantDetail(repositoryDomain: getIt()));
  getIt.registerLazySingleton(
      () => GetRestaurantReview(repositoryDomain: getIt()));
  getIt.registerLazySingleton(
      () => GetRestaurantReviewAdd(repositoryDomain: getIt()));
  getIt.registerLazySingleton(
      () => GetRestaurantMenu(repositoryDomain: getIt()));
  getIt.registerLazySingleton(() => GetTour(repositoryDomain: getIt()));
  getIt.registerLazySingleton(() => GetTourDetail(repositoryDomain: getIt()));
  getIt.registerLazySingleton(() => GetTourReview(repositoryDomain: getIt()));
  getIt
      .registerLazySingleton(() => GetTourReviewAdd(repositoryDomain: getIt()));
  getIt.registerLazySingleton(() => GetTourGuide(repositoryDomain: getIt()));
  getIt.registerLazySingleton(() => GetHotel(repositoryDomain: getIt()));
  getIt.registerLazySingleton(() => GetHotelDetail(repositoryDomain: getIt()));
  getIt.registerLazySingleton(() => GetHotelReview(repositoryDomain: getIt()));
  getIt.registerLazySingleton(
      () => GetHotelReviewAdd(repositoryDomain: getIt()));

  // Repositories
  getIt.registerLazySingleton<RepositoryDomain>(
      () => RepositoryDomainImpl(remoteDataSource: getIt()));

  // Data sources
  getIt.registerLazySingleton<RemoteDataSource>(
      () => RemoteDatasourceImpl(client: getIt()));

  // Http service
  getIt.registerLazySingleton(() => http.Client());
}
