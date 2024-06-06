import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:simalungun_tourism/data/datasource/local_datasource.dart';
import 'package:simalungun_tourism/injection.dart';
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
import 'package:simalungun_tourism/presentation/pages/bottom_nav_page.dart';
import 'package:simalungun_tourism/presentation/pages/festival_detail_page.dart';
import 'package:simalungun_tourism/presentation/pages/forgot_password_page.dart';
import 'package:simalungun_tourism/presentation/pages/hotel_detail_page.dart';
import 'package:simalungun_tourism/presentation/pages/hotel_page.dart';
import 'package:simalungun_tourism/presentation/pages/login_page.dart';
import 'package:simalungun_tourism/presentation/pages/more_page.dart';
import 'package:simalungun_tourism/presentation/pages/news_detail_page.dart';
import 'package:simalungun_tourism/presentation/pages/onboarding_page.dart';
import 'package:simalungun_tourism/presentation/pages/register_page.dart';
import 'package:simalungun_tourism/presentation/pages/restaurant_detail_page.dart';
import 'package:simalungun_tourism/presentation/pages/restaurant_page.dart';
import 'package:simalungun_tourism/presentation/pages/splash_screen_page.dart';
import 'package:simalungun_tourism/presentation/pages/tour_detail_page.dart';
import 'package:simalungun_tourism/presentation/pages/tour_page.dart';

void main() {
  init();
  runApp(const MyApp());
  initializeDateFormatting('id_ID', null);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<LoginBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<RegisterBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<ForgetPasswordBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<ProfileBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<NewsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<FestivalBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<FestivalDetailBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<NewsDetailBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<TourBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<TourGuideBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<TourDetailBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<TourReviewBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<HotelBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<HotelReviewBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<RestaurantBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<RestaurantDetailBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<RestaurantReviewBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<RestaurantMenuBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<HotelDetailBloc>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Simalungun Tourism',
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          
        ),
        routerConfig: GoRouter(
          initialLocation: SplashScreenpage.routeName,
          routes: [
            GoRoute(
                path: SplashScreenpage.routeName,
                name: SplashScreenpage.routeName,
                builder: (context, state) => SplashScreenpage()),
            GoRoute(
                path: OnboardingPage.routeName,
                name: OnboardingPage.routeName,
                builder: (context, state) => OnboardingPage()),
            GoRoute(
                path: LoginPage.routeName,
                name: LoginPage.routeName,
                builder: (context, state) => LoginPage(),
                routes: [
                  GoRoute(
                      path: RegisterPage.routeName,
                      name: RegisterPage.routeName,
                      builder: (context, state) => RegisterPage()),
                  GoRoute(
                      path: ForgotPasswordPage.routeName,
                      name: ForgotPasswordPage.routeName,
                      builder: (context, state) => ForgotPasswordPage()),

                ]),
            GoRoute(
              path: BottomNavpage.routeName,
              name: BottomNavpage.routeName,
              builder: (context, state) => const BottomNavpage(),
              redirect: (context, state) async {
                final isLogin = await LocalDataSource().getToken();
                log(isLogin.toString());
                if (isLogin != "") {
                  return null;
                } else {
                  return OnboardingPage.routeName;
                }
              },
              routes: [
                GoRoute(
                    path: NewsDetailPage.routeName,
                    name: NewsDetailPage.routeName,
                    builder: (context, state) =>  NewsDetailPage()),
                GoRoute(
                    path: FestivalDetailPage.routeName,
                    name: FestivalDetailPage.routeName,
                    builder: (context, state) => const FestivalDetailPage()),
                GoRoute(
                    path: RestaurantPage.routeName,
                    name: RestaurantPage.routeName,
                    builder: (context, state) => RestaurantPage(),
                    routes: [
                      GoRoute(
                          path: RestaurantDetailPage.routeName,
                          name: RestaurantDetailPage.routeName,
                          builder: (context, state) => RestaurantDetailPage()),
                    ]),
                GoRoute(
                    path: TourPage.routeName,
                    name: TourPage.routeName,
                    builder: (context, state) => TourPage(),
                    routes: [
                      GoRoute(
                          path: TourDetailPage.routeName,
                          name: TourDetailPage.routeName,
                          builder: (context, state) => TourDetailPage()),
                    ]),
                GoRoute(
                    path: HotelPage.routeName,
                    name: HotelPage.routeName,
                    builder: (context, state) => HotelPage(),
                    routes: [
                      GoRoute(
                          path: HotelDetailPage.routeName,
                          name: HotelDetailPage.routeName,
                          builder: (context, state) => HotelDetailPage()),
                    ]),
                GoRoute(
                    path: MorePage.routeName,
                    name: MorePage.routeName,
                    builder: (context, state) => const MorePage())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
