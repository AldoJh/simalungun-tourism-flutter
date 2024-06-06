import 'dart:io';

import 'package:simalungun_tourism/data/models/festival_detail_model.dart';
import 'package:simalungun_tourism/data/models/festival_model.dart';
import 'package:simalungun_tourism/data/models/forget_password_model.dart';
import 'package:simalungun_tourism/data/models/hotel_detail_model.dart';
import 'package:simalungun_tourism/data/models/hotel_model.dart';
import 'package:simalungun_tourism/data/models/hotel_review_model.dart';
import 'package:simalungun_tourism/data/models/login_model.dart';
import 'package:simalungun_tourism/data/models/news_comment_model.dart';
import 'package:simalungun_tourism/data/models/news_detail_model.dart';
import 'package:simalungun_tourism/data/models/news_model.dart';
import 'package:simalungun_tourism/data/models/profile_model.dart';
import 'package:simalungun_tourism/data/models/register_model.dart';
import 'package:simalungun_tourism/data/models/restaurant_detail_model.dart';
import 'package:simalungun_tourism/data/models/restaurant_menu_model.dart';
import 'package:simalungun_tourism/data/models/restaurant_model.dart';
import 'package:simalungun_tourism/data/models/restaurant_review_model.dart';
import 'package:simalungun_tourism/data/models/review_model.dart';
import 'package:simalungun_tourism/data/models/tour_detail_model.dart';
import 'package:simalungun_tourism/data/models/tour_guide_model.dart';
import 'package:simalungun_tourism/data/models/tour_model.dart';
import 'package:simalungun_tourism/data/models/tour_review_model.dart';

abstract class RemoteDataSource {
  //Auth
  Future<LoginModel> PostLogin(String email, String password);
  Future<RegisterModel> PostRegister(
      String name, String email, String phone, String password);

  //profile
  Future<ProfileModel> fetchProfile();
  Future<ProfileModel> updateProfilePicture(File image);
  Future<ProfileModel> updateProfile(String name, String email, String phone);
  Future<ProfileModel> updateProfilePassword( String newPassword);

  //festival
  Future<FestivalModel> fetchFestival(String query, int page, int perPage);
  Future<FestivalDetailModel> fetchFestivalDetail(int id);

  //news
  Future<NewsModel> fetchNews(String query, int page, int perPage);
  Future<NewsDetailModel> fetchNewsDetail(int id);
  Future<NewsCommentModel> postNewsComment(int id, String comment);

  //Hotel
  Future<HotelModel> fetchHotel(String query, int page, int perPage);
  Future<HotelDetailModel> fetchHotelDetail(int id);
  Future<HotelReviewModel> fetchHotelReview(int id);
  Future<ReviewModel> postHotelReview(int id, int rate, String comment);

  //tour
  Future<TourModel> fetchTour(String query, int page, int perPage);
  Future<TourDetailModel> fetchTourDetail(int id);
  Future<TourReviewModel> fetchTourReview(int id);
  Future<TourGuideModel> fetchTourGuide(int id);
  Future<ReviewModel> postTourReview(int id, int rate, String comment);

  //restaurant
  Future<RestaurantModel> fetchRestaurant(String query, int page, int perPage);
  Future<RestaurantDetailModel> fetchRestaurantDetail(int id);
  Future<RestaurantReviewModel> fetchRestaurantReview(int id);
  Future<RestaurantMenuModel> fetchRestaurantMenu(int id);
  Future<ReviewModel> postRestaurantReview(int id, int rate, String comment);

  //Forget Password
  Future<ForgetPasswordModel> postForgetPassword(String email);
}
