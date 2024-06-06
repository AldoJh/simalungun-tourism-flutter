import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:simalungun_tourism/domain/entity/festival_detail_entity.dart';
import 'package:simalungun_tourism/domain/entity/festival_entity.dart';
import 'package:simalungun_tourism/domain/entity/forget_password_entity.dart';
import 'package:simalungun_tourism/domain/entity/hotel_detail_entity.dart';
import 'package:simalungun_tourism/domain/entity/hotel_entity.dart';
import 'package:simalungun_tourism/domain/entity/hotel_review_entity.dart';
import 'package:simalungun_tourism/domain/entity/login_entity.dart';
import 'package:simalungun_tourism/domain/entity/news_comment_entity.dart';
import 'package:simalungun_tourism/domain/entity/news_detail_entity.dart';
import 'package:simalungun_tourism/domain/entity/news_entity.dart';
import 'package:simalungun_tourism/domain/entity/profile_entity.dart';
import 'package:simalungun_tourism/domain/entity/register_entity.dart';
import 'package:simalungun_tourism/domain/entity/restaurant_detail_entity.dart';
import 'package:simalungun_tourism/domain/entity/restaurant_entity.dart';
import 'package:simalungun_tourism/domain/entity/restaurant_menu_entity.dart';
import 'package:simalungun_tourism/domain/entity/restaurant_review_entity.dart';
import 'package:simalungun_tourism/domain/entity/review_entity.dart';
import 'package:simalungun_tourism/domain/entity/tour_detail_entity.dart';
import 'package:simalungun_tourism/domain/entity/tour_entity.dart';
import 'package:simalungun_tourism/domain/entity/tour_guider_entity.dart';
import 'package:simalungun_tourism/domain/entity/tour_review_entity.dart';

abstract class RepositoryDomain {

  //auth
  Future<Either<String, LoginEntity>> Login(String email, String password);
  Future<Either<String, RegisterEntity>> Register(
      String name, String email, String phone, String password);

  //profile
  Future<Either<String, ProfileEntity>> fetchProfile();
  Future<Either<String, ProfileEntity>> updateProfilePicture(File image);
  Future<Either<String, ProfileEntity>> updateProfile(String name, String email, String phone);
  Future<Either<String, ProfileEntity>> updateProfilePassword(String newPassword);

  //news
  Future<Either<String, NewsEntity>> getNews(String query, int page, int perPage);
  Future<Either<String, NewsDetailEntity>> getNewsDetail(int id);
  Future<Either<String, NewsCommentEntity>> PostNewsComment(int id, String comment);

  //festival
  Future<Either<String, FestivalEntity>> getFestival(String query,int page, int perPage);
  Future<Either<String, FestivalDetailEntity>> getFestivalDetail(int id);

  //restaurant
  Future<Either<String, RestaurantEntity>> FetchRestaurant(String query, int page, int perPage);
  Future<Either<String, RestaurantDetailEntity>> FetchRestaurantDetail(int id); 
  Future<Either<String, RestaurantReviewEntity>> FetchRestaurantReview(int id);
  Future<Either<String, RestaurantMenuEntity>> FetchRestaurantMenu(int id);
  Future<Either<String, ReviewEntity>> PostRestaurantReview(int id, int rate, String comment);

  //tour
  Future<Either<String, TourEntity>> FetchTour(String query, int page, int perPage);
  Future<Either<String, TourDetailEntity>> FetchTourDetail(int id);
  Future<Either<String, TourReviewEntity>> FetchTourReview(int id);
  Future<Either<String, TourGuideEntity>> FetchTourGuide(int id);
  Future<Either<String, ReviewEntity>> PostTourReview(int id, int rate, String comment);

  //hotel
  Future<Either<String, HotelEntity>> FetchHotel(String query, int page, int perPage);
  Future<Either<String, HotelDetailEntity>> FetchHotelDetail(int id);
  Future<Either<String, HotelReviewEntity>> FetchHotelReview(int id);
  Future<Either<String, ReviewEntity>> PostHotelReview(int id, int rate, String comment);

  //Forget Password
  Future<Either<String, ForgetPasswordEntity>> PostForgetPassword(String email);


}
