import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simalungun_tourism/common/const.dart';
import 'package:simalungun_tourism/common/helper.dart';
import 'package:simalungun_tourism/presentation/bloc/festival/festival_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/festival_detail/festival_detail_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/news/news_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/news_detail/news_detail_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/profile/profile_bloc.dart';
import 'package:simalungun_tourism/presentation/pages/festival_detail_page.dart';
import 'package:simalungun_tourism/presentation/pages/hotel_page.dart';
import 'package:simalungun_tourism/presentation/pages/more_page.dart';
import 'package:simalungun_tourism/presentation/pages/news_detail_page.dart';
import 'package:simalungun_tourism/presentation/pages/restaurant_page.dart';
import 'package:simalungun_tourism/presentation/pages/tour_page.dart';
import 'package:simalungun_tourism/presentation/widget/button_home_custom.dart';
import 'package:simalungun_tourism/presentation/widget/list%20_festival_home.dart';
import 'package:simalungun_tourism/presentation/widget/list_berita_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  initState() {
    context.read<FestivalBloc>().add(FetchFestivalEvent(query: ""));
    context.read<NewsBloc>().add(FetchNewsEvent(query: ""));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.PrimaryColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                backgroundColor: constants.PrimaryColor,
                expandedHeight: 180.0,
                floating: false,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Container(
                    height: 234,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        stops: [0.79, 1, 1],
                        colors: [
                          Color(0xfffe79024),
                          Color(0xffF2F2F2),
                          Color(0xffBD998D),
                        ],
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/banner/mask-home.png'),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 40),
                              BlocBuilder<ProfileBloc, ProfileState>(
                                builder: (context, state) {
                                  if (state is ProfileLoaded) {
                                    return Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 32,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 30,
                                            backgroundImage: NetworkImage(state
                                                .profile!.data!.photo!
                                                .replaceAll(' ', '')),
                                          ),
                                        ),
                                        SizedBox(width: 11),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Hello,",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              state.profile!.data!.name!,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        )
                                      ],
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              ),
                              SizedBox(height: 18),
                              Text(
                                "Explore Simalungun !",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                "Temukan tempat untuk anda ",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Builder(
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtomHomeCustom(
                            onTap: () {
                              context.goNamed(TourPage.routeName);
                            },
                            imageAssets: "assets/icons/wisata.png",
                            label: "Wisata",
                            backgroundColor: Color(0xff36C9C1)),
                        ButtomHomeCustom(
                            onTap: () {
                              context.goNamed(HotelPage.routeName);
                            },
                            imageAssets: 'assets/icons/hotel.png',
                            label: "Hotel",
                            backgroundColor: Color(0xffEC8C6F)),
                        ButtomHomeCustom(
                            onTap: () {
                              context.goNamed(RestaurantPage.routeName);
                            },
                            imageAssets: 'assets/icons/resto.png',
                            label: "Resto",
                            backgroundColor: Color(0xffFFD966)),
                        ButtomHomeCustom(
                            onTap: () {
                              context.goNamed(MorePage.routeName);
                              
                            },
                            imageAssets: 'assets/icons/lainnya.png',
                            label: "Lainnya",
                            backgroundColor: Color(0xff8294C4))
                      ],
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Festival",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            "Lihat Semua",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: constants.PrimaryColor),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 241,
                      child: BlocBuilder<FestivalBloc, FestivalState>(
                        builder: (context, state) {
                          if (state is FestivalLoading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is FestivalError) {
                            return Center(
                              child: Text(state.message),
                            );
                          } else if (state is FestivalLoaded) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.festival.length,
                              itemBuilder: (context, index) {
                                return ListFestivalHome(
                                    image: state.festival[index].image,
                                    title: state.festival[index].name,
                                    onTap: () {
                                      context.read<FestivalDetailBloc>().add(
                                          FetchFestivalDetailEvent(
                                              id: state.festival[index].id!));
                                      context.goNamed(
                                          FestivalDetailPage.routeName);
                                    });
                              },
                            );
                          } else {
                            return Center(
                              child: Text(""),
                            );
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Berita",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            "Lihat Semua",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: constants.PrimaryColor),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<NewsBloc, NewsState>(
                      builder: (context, state) {
                        if (state is NewsLoaded) {
                          return Column(
                            children: state.news.map((e) {
                              return Column(
                                children: [
                                  ListBeritahome(
                                    image: e.image,
                                    title: e.title,
                                    description: Helper.removeAllHtmlTags(
                                        e.content ?? ""),
                                    date: e.date,
                                    onTap: () {
                                      context
                                          .read<NewsDetailBloc>()
                                          .add(FetchNewsDetailEvent(id: e.id!));
                                      context.goNamed(NewsDetailPage.routeName);
                                    },
                                  ),
                                  SizedBox(height: 10)
                                ],
                              );
                            }).toList(),
                          );
                        } else if (state is NewsLoading) {
                          return SizedBox(
                            height: 300,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else if (state is NewsError) {
                          return Center(
                            child: Text(state.message),
                          );
                        } else {
                          return Center(
                            child: Text(""),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
