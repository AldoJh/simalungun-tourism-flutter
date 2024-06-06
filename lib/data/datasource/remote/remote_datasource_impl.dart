import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:simalungun_tourism/common/const.dart';
import 'package:simalungun_tourism/data/datasource/local_datasource.dart';
import 'package:simalungun_tourism/data/datasource/remote_datasource.dart';
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

class RemoteDatasourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDatasourceImpl({required this.client});

  @override
  Future<LoginModel> PostLogin(String email, String password) async {
    var response =
        await client.post(Uri.parse('${constants.baseUrl}/auth/login'),
            headers: {
              'Content-Type': 'application/json',
            },
            body: jsonEncode({'email': email, 'password': password}));

    return LoginModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<RegisterModel> PostRegister(
      String name, String email, String phone, String password) async {
    // await Future.delayed(Duration(seconds: 5));
    log('name: $name, email: $email, password: $password, phone: $phone');
    var response = await client.post(
      Uri.parse('${constants.baseUrl}/auth/register'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
          {'name': name, 'email': email, 'password': password, 'phone': phone}),
    );

    log('response: ${response.body}',
        name: 'PostRegister - RemoteDatasourceImpl');

    return await RegisterModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<NewsModel> fetchNews(String query, int page, int perPage) async {
    var token = await LocalDataSource().getToken();
    var response = await client.get(
        Uri.parse(
            '${constants.baseUrl}/news?q=$query&page=$page&perPage=$perPage'),
        headers: {
          'Authorization': 'Bearer $token',
        });
    return NewsModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<FestivalModel> fetchFestival(
      String query, int page, int perPage) async {
    var token = await LocalDataSource().getToken();
    var response = await client.get(
        Uri.parse(
            '${constants.baseUrl}/event?q=$query&page=$page&perPage=$perPage'),
        headers: {
          'Authorization': 'Bearer $token',
        });
    return FestivalModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<FestivalDetailModel> fetchFestivalDetail(int id) async {
    var token = await LocalDataSource().getToken();

    var response =
        await client.get(Uri.parse('${constants.baseUrl}/event/$id'), headers: {
      'Authorization': 'Bearer $token',
    });
    return FestivalDetailModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<NewsDetailModel> fetchNewsDetail(int id) async {
    var token = await LocalDataSource().getToken();

    var response =
        await client.get(Uri.parse('${constants.baseUrl}/news/$id'), headers: {
      'Authorization': 'Bearer $token',
    });

    // log('response: ${response.body}');
    return NewsDetailModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<HotelModel> fetchHotel(String query, int page, int perPage) async {
    var token = await LocalDataSource().getToken();
    var response = await client.get(
        Uri.parse(
            '${constants.baseUrl}/hotel?q=$query&page=$page&perPage=$perPage'),
        headers: {
          'Authorization': 'Bearer $token',
        });
    return HotelModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<ProfileModel> fetchProfile() async {
    var token = await LocalDataSource().getToken();
    var response =
        await client.get(Uri.parse('${constants.baseUrl}/account'), headers: {
      'Authorization': 'Bearer $token',
    });
    return ProfileModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<TourModel> fetchTour(String query, int page, int perPage) async {
    var token = await LocalDataSource().getToken();
    var response = await client.get(
        Uri.parse(
            '${constants.baseUrl}/tourism?q=$query&page=$page&perPage=$perPage'),
        headers: {
          'Authorization': 'Bearer $token',
        });
    return TourModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<RestaurantModel> fetchRestaurant(
      String query, int page, int perPage) async {
    var token = await LocalDataSource().getToken();
    var response = await client.get(
        Uri.parse(
            '${constants.baseUrl}/restaurant?q=$query&page=$page&perPage=$perPage'),
        headers: {
          'Authorization': 'Bearer $token',
        });
    return RestaurantModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<HotelDetailModel> fetchHotelDetail(int id) async {
    var token = await LocalDataSource().getToken();
    var response =
        await client.get(Uri.parse('${constants.baseUrl}/hotel/$id'), headers: {
      'Authorization': 'Bearer $token',
    });

    return HotelDetailModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<RestaurantDetailModel> fetchRestaurantDetail(int id) async {
    var token = await LocalDataSource().getToken();
    var response = await client
        .get(Uri.parse('${constants.baseUrl}/restaurant/$id'), headers: {
      'Authorization': 'Bearer $token',
    });

    return RestaurantDetailModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<TourDetailModel> fetchTourDetail(int id) async {
    var token = await LocalDataSource().getToken();
    var response = await client
        .get(Uri.parse('${constants.baseUrl}/tourism/$id'), headers: {
      'Authorization': 'Bearer $token',
    });

    return TourDetailModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<HotelReviewModel> fetchHotelReview(int id) async {
    var token = await LocalDataSource().getToken();
    var response = await client
        .get(Uri.parse('${constants.baseUrl}/hotel/$id/review'), headers: {
      'Authorization': 'Bearer $token',
    });

    return HotelReviewModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<RestaurantReviewModel> fetchRestaurantReview(int id) async {
    var token = await LocalDataSource().getToken();
    var response = await client
        .get(Uri.parse('${constants.baseUrl}/restaurant/$id/review'), headers: {
      'Authorization': 'Bearer $token',
    });

    // log('response: ${response.body}', name: 'fetchRestaurantReview');

    return RestaurantReviewModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<TourReviewModel> fetchTourReview(int id) async {
    var token = await LocalDataSource().getToken();
    var response = await client
        .get(Uri.parse('${constants.baseUrl}/tourism/$id/review'), headers: {
      'Authorization': 'Bearer $token',
    });

    return TourReviewModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<RestaurantMenuModel> fetchRestaurantMenu(int id) async {
    var token = await LocalDataSource().getToken();
    var response = await client
        .get(Uri.parse('${constants.baseUrl}/restaurant/$id/menu'), headers: {
      'Authorization': 'Bearer $token',
    });

    return RestaurantMenuModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<TourGuideModel> fetchTourGuide(int id) async {
    var token = await LocalDataSource().getToken();
    var response = await client
        .get(Uri.parse('${constants.baseUrl}/tourism/$id/guide'), headers: {
      'Authorization': 'Bearer $token',
    });

    return TourGuideModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<ReviewModel> postHotelReview(int id, int rate, String comment) async {
    var token = await LocalDataSource().getToken();
    var response = await client.post(
        Uri.parse('${constants.baseUrl}/hotel/$id/review'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({'rate': rate, 'comment': comment}));

    return ReviewModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<ReviewModel> postRestaurantReview(
      int id, int rate, String comment) async {
    var token = await LocalDataSource().getToken();
    var response = await client.post(
        Uri.parse('${constants.baseUrl}/restaurant/$id/review'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({'rate': rate, 'comment': comment}));

    return ReviewModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<ReviewModel> postTourReview(int id, int rate, String comment) async {
    var token = await LocalDataSource().getToken();
    var response = await client.post(
        Uri.parse('${constants.baseUrl}/tourism/$id/review'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({'rate': rate, 'comment': comment}));

    log('response: ${response.body}', name: 'postTourReview');

    return ReviewModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<ForgetPasswordModel> postForgetPassword(String email) async {
    var response =
        await client.post(Uri.parse('${constants.baseUrl}/auth/forget'),
            headers: {
              'Content-Type': 'application/json',
            },
            body: jsonEncode({'email': email}));

    return ForgetPasswordModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<NewsCommentModel> postNewsComment(int id, String comment) async {
    var token = await LocalDataSource().getToken();
    var response = await client.post(
        Uri.parse('${constants.baseUrl}/news/$id/comment'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({'comment': comment}));

    return NewsCommentModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<ProfileModel> updateProfilePicture(File image) async {
    var token = await LocalDataSource().getToken();
    var request =
        http.MultipartRequest('POST', Uri.parse('${constants.baseUrl}/account'))
          ..headers['Authorization'] = 'Bearer $token'
          ..files.add(await http.MultipartFile.fromPath('photo', image.path));

    var response = await request.send();
    var responseString = await response.stream.bytesToString();

    return ProfileModel.fromJson(jsonDecode(responseString));
  }

  @override
  Future<ProfileModel> updateProfile(
      String name, String email, String phone) async {
    var token = await LocalDataSource().getToken();
    var response = await client.post(Uri.parse('${constants.baseUrl}/account'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({'name': name, 'email': email, 'phone': phone}));

    return ProfileModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<ProfileModel> updateProfilePassword(String newPassword) async {
    var token = await LocalDataSource().getToken();
    var response = await client.post(Uri.parse('${constants.baseUrl}/account'),
        headers: { 'Authorization': 'Bearer $token'},
        body: jsonEncode({'password': newPassword}));

    return ProfileModel.fromJson(jsonDecode(response.body));
  }
}
