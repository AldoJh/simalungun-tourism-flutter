import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:simalungun_tourism/data/datasource/remote_datasource.dart';
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
import 'package:simalungun_tourism/domain/repositories/repository_domain.dart';

class RepositoryDomainImpl implements RepositoryDomain {
  RemoteDataSource remoteDataSource;
  RepositoryDomainImpl({required this.remoteDataSource});
  @override
  Future<Either<String, FestivalEntity>> getFestival(
      String query, int page, int perPage) async {
    try {
      var result = await remoteDataSource.fetchFestival(query, page, perPage);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, NewsEntity>> getNews(
      String query, int page, int perPage) async {
    try {
      var result = await remoteDataSource.fetchNews(query, page, perPage);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, FestivalDetailEntity>> getFestivalDetail(int id) async {
    try {
      var result = await remoteDataSource.fetchFestivalDetail(id);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, NewsDetailEntity>> getNewsDetail(int id) async {
    try {
      var result = await remoteDataSource.fetchNewsDetail(id);
      log('result: $result', name: 'getNewsDetail - RepositoryDomainImpl');
      return Right(result.toEntity());
    } catch (e) {
      log('error: $e', name: 'getNewsDetail - RepositoryDomainImpl');
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, LoginEntity>> Login(
      String email, String password) async {
    try {
      var result = await remoteDataSource.PostLogin(email, password);
      log('result: $result', name: 'Login - RepositoryDomainImpl');
      return Right(result.toEntity());
    } catch (e) {
      log('error: $e', name: 'Login - RepositoryDomainImpl');
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, RegisterEntity>> Register(
    String name,
    String email,
    String phone,
    String password,
  ) async {
    try {
      var result =
          await remoteDataSource.PostRegister(name, email, phone, password);
      log('result: $result', name: 'Register - RepositoryDomainImpl');
      return Right(result.toEntity());
    } catch (e) {
      log('error: $e', name: 'Register - RepositoryDomainImpl');
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, RestaurantEntity>> FetchRestaurant(
      String query, int page, int perPage) async {
    try {
      var result = await remoteDataSource.fetchRestaurant(query, page, perPage);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, TourEntity>> FetchTour(
      String query, int page, int perPage) async {
    try {
      var result = await remoteDataSource.fetchTour(query, page, perPage);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, ProfileEntity>> fetchProfile() async {
    try {
      var result = await remoteDataSource.fetchProfile();
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, HotelEntity>> FetchHotel(
      String query, int page, int perPage) async {
    try {
      var result = await remoteDataSource.fetchHotel(query, page, perPage);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, HotelDetailEntity>> FetchHotelDetail(int id) async {
    try {
      var result = await remoteDataSource.fetchHotelDetail(id);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, RestaurantDetailEntity>> FetchRestaurantDetail(
      int id) async {
    try {
      log('fetch restaurant detail id: $id', name: 'FetchRestaurantDetail');
      var result = await remoteDataSource.fetchRestaurantDetail(id);
      return Right(result.toEntity());
    } catch (e) {
      log('error: $e', name: 'FetchRestaurantDetail');
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, TourDetailEntity>> FetchTourDetail(int id) async {
    try {
      var result = await remoteDataSource.fetchTourDetail(id);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, HotelReviewEntity>> FetchHotelReview(int id) async {
    try {
      var result = await remoteDataSource.fetchHotelReview(id);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, RestaurantReviewEntity>> FetchRestaurantReview(
      int id) async {
    try {
      var result = await remoteDataSource.fetchRestaurantReview(id);
      log('result: $result', name: 'FetchRestaurantReview');
      return Right(result.toEntity());
    } catch (e) {
      log('error: $e', name: 'FetchRestaurantReview');
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, TourReviewEntity>> FetchTourReview(int id) async {
    try {
      var result = await remoteDataSource.fetchTourReview(id);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, RestaurantMenuEntity>> FetchRestaurantMenu(
      int id) async {
    try {
      var result = await remoteDataSource.fetchRestaurantMenu(id);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, TourGuideEntity>> FetchTourGuide(int id) async {
    try {
      var result = await remoteDataSource.fetchTourGuide(id);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, ReviewEntity>> PostHotelReview(
      int id, int rate, String comment) async {
    try {
      var result = await remoteDataSource.postHotelReview(id, rate, comment);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, ReviewEntity>> PostRestaurantReview(
      int id, int rate, String comment) async {
    try {
      var result =
          await remoteDataSource.postRestaurantReview(id, rate, comment);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, ReviewEntity>> PostTourReview(
      int id, int rate, String comment) async {
    try {
      var result = await remoteDataSource.postTourReview(id, rate, comment);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, ForgetPasswordEntity>> PostForgetPassword(
      String email) async {
    try {
      var result = await remoteDataSource.postForgetPassword(email);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, NewsCommentEntity>> PostNewsComment(
      int id, String comment) async {
    try {
      var result = await remoteDataSource.postNewsComment(id, comment);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, ProfileEntity>> updateProfile(
      String name, String email, String phone) async {
    try {
      var result = await remoteDataSource.updateProfile(name, email, phone);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, ProfileEntity>> updateProfilePassword(
      String newPassword) async {
    try {
      var result = await remoteDataSource.updateProfilePassword(newPassword);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, ProfileEntity>> updateProfilePicture(File image) async {
    try {
      var result = await remoteDataSource.updateProfilePicture(image);
      log('result: $result',
          name: 'updateProfilePicture - RepositoryDomainImpl');
      return Right(result.toEntity());
    } catch (e) {
      log('error: $e', name: 'updateProfilePicture - RepositoryDomainImpl');
      return Left(e.toString());
    }
  }
}
