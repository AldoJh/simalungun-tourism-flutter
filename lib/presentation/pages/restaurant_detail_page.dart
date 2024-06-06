import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:simalungun_tourism/common/const.dart';
import 'package:simalungun_tourism/common/helper.dart';
import 'package:simalungun_tourism/presentation/bloc/restaurant_detail/restaurant_detail_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/restaurant_menu/restaurant_menu_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/restaurant_review/restaurant_review_bloc.dart';
import 'package:simalungun_tourism/presentation/widget/share_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

int? id;

class RestaurantDetailPage extends StatefulWidget {
  static const routeName = "RestaurantDetailPage";

  @override
  _RestaurantDetailPageState createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int activeIndex = 0;
  CarouselController carouselController = CarouselController();
  String latitude = '';
  String longitude = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: constants.PrimaryColor,
          foregroundColor: Colors.white,
          onPressed: () async {
            final uri = Uri(
                scheme: "google.navigation",
                // host: '"0,0"',  {here we can put host}
                queryParameters: {'q': '$latitude, $longitude'});
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri);
            } else {
              log('Could not launch $uri', name: 'RestaurantDetailPage');
            }
          },
          label: Text("Rute"),
          icon: Icon(Icons.directions)),
      body: BlocConsumer<RestaurantDetailBloc, RestaurantDetailState>(
        listener: (context, state) {
          if (state is RestaurantDetailLoaded) {
            longitude = state.restaurant.data!.location!.longitude!;
            latitude = state.restaurant.data!.location!.latitude!;
            id = state.restaurant.data!.id!.toInt();
          }
        },
        builder: (context, state) {
          if (state is RestaurantDetailLoaded) {
            if (state.restaurant.data!.images!.isEmpty) {
              state.restaurant.data!.images!.add(
                  'https://demo.gariskode.com/storage/resto/1661304794-default.png');
            }
            return NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    elevation: 1,
                    leading: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                    actions: [
                      ShareButton(
                          facebookShareLink:
                              state.restaurant.data!.share!.facebook!,
                          whatsappShareLink:
                              state.restaurant.data!.share!.whatsapp!,
                          linkedinShareLink:
                              state.restaurant.data!.share!.linkedin!)
                    ],
                    pinned: false,
                    backgroundColor: Colors.white,
                    expandedHeight: 300.0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        children: [
                          CarouselSlider.builder(
                            carouselController: carouselController,
                            itemCount: state.restaurant.data!.images!.length,
                            itemBuilder: (context, index, realIndex) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(16),
                                    bottomRight: Radius.circular(16),
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.5),
                                      const Color.fromARGB(255, 165, 107, 107)
                                          .withOpacity(0.1),
                                    ],
                                  ),
                                  image: DecorationImage(
                                      colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.5),
                                        BlendMode.darken,
                                      ),
                                      image: NetworkImage(
                                        state.restaurant.data!.images![index],
                                      ),
                                      fit: BoxFit.cover),
                                ),
                              );
                            },
                            options: CarouselOptions(
                              height: 400,
                              viewportFraction: 1,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 5),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  activeIndex = index;
                                });
                              },
                            ),
                          ),
                          Positioned.fill(
                            bottom: 16,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: AnimatedSmoothIndicator(
                                activeIndex: activeIndex,
                                count: state.restaurant.data!.images!.length,
                                effect: WormEffect(
                                  dotWidth: 8,
                                  dotHeight: 8,
                                  activeDotColor: Colors.white,
                                  dotColor: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            right: 16,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                icon: Icon(Icons.arrow_forward_ios),
                                color: Colors.white,
                                onPressed: () {
                                  carouselController.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.linear,
                                  );
                                },
                              ),
                            ),
                          ),
                          Positioned.fill(
                            left: 16,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                icon: Icon(Icons.arrow_back_ios),
                                color: Colors.white,
                                onPressed: () {
                                  carouselController.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.linear,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: false,
                    delegate: _SliverAppBarDelegate(
                      TabBar(
                        isScrollable: true,
                        labelPadding: EdgeInsets.symmetric(horizontal: 8),
                        dividerColor: Colors.transparent,
                        indicatorColor: constants.PrimaryColor,
                        labelColor: Colors.black,
                        labelStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        unselectedLabelColor: Colors.grey,
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        controller: _tabController,
                        tabs: [
                          Tab(child: Text('Details')),
                          Tab(child: Text('Menu')),
                          Tab(child: Text('Review')),
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(left: 24, right: 24, top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.restaurant.data!.name!,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  color: constants.PrimaryColor),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                    state.restaurant.data!.location!.address!,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey[600])),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.phone,
                                          color: constants.PrimaryColor,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "Telepon",
                                          style: TextStyle(fontSize: 12),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      state.restaurant.data!.phone!,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 16),
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border(
                                      left: BorderSide(
                                        color: Colors.grey,
                                        width: 3,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: constants.PrimaryColor,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "Rating",
                                          style: TextStyle(fontSize: 12),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      state.restaurant.data!.rating!.rate! == 0
                                          ? 'Belum ada rating'
                                          : state.restaurant.data!.rating!.rate
                                                  .toString() +
                                              ' / 5',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            Helper.removeAllHtmlTags(
                                state.restaurant.data?.description ?? ""),
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[600]),
                          ),
                          SizedBox(height: 20),
                          Text("Fasilitas",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text(
                            state.restaurant.data!.facilities!
                                .map((e) => e.name!)
                                .join(', '),
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[600]),
                          ),
                          SizedBox(height: 20),
                          Text("Jumlah Kursi",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text(
                            state.restaurant.data!.chairCount.toString() +
                                ' kursi',
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[600]),
                          ),
                          SizedBox(height: 20),
                          Text("Jumlah Meja",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text(
                            state.restaurant.data!.tableCount.toString() +
                                ' Meja',
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[600]),
                          ),
                          SizedBox(height: 20),
                          Text("Label",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text(
                            state.restaurant.data!.label!,
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[600]),
                          ),
                          SizedBox(height: 20),
                          Text("owner",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text(
                            state.restaurant.data!.owner!,
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  menuTabbar(),
                  reviewTabbar(),
                ],
              ),
            );
          } else if (state is RestaurantDetailError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class menuTabbar extends StatelessWidget {
  const menuTabbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<RestaurantMenuBloc, RestaurantMenuState>(
        builder: (context, state) {
          if (state is RestaurantMenuLoaded) {
            return Container(
              padding: EdgeInsets.only(left: 24, right: 24, top: 16),
              child: Column(
                children: [
                  Container(
                    height: 58,
                    decoration: BoxDecoration(
                      color: constants.PrimaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Menu",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Text("harga",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.restaurantMenu.data!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 58,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey[300]!,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              state.restaurantMenu.data![index].name!,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                                Helper.rupiahFormat(int.parse(
                                    state.restaurantMenu.data![index].price!)),
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            );
          } else if (state is RestaurantMenuError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class reviewTabbar extends StatelessWidget {
  int ratingStar = 5;
  TextEditingController commentController = TextEditingController();
  reviewTabbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<RestaurantReviewBloc, RestaurantReviewState>(
        listener: (context, state) {
          if (state is RestaurantReviewAdded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Ulasan berhasil ditambahkan"),
              ),
            );
            context
                .read<RestaurantReviewBloc>()
                .add(FetchRestaurantReviewEvent(id: id!));
          }
        },
        builder: (context, state) {
          if (state is RestaurantReviewLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Ulasan (${state.restaurantReview.data!.length})",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                                backgroundColor: Colors.white,
                                          surfaceTintColor: Colors.white,
                                  title: Text("Tambah ulasan"),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      RatingBar.builder(
                                        initialRating: 5,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: false,
                                        itemCount: 5,
                                        itemSize: 24,
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          ratingStar = rating.toInt();
                                        },
                                      ),
                                      SizedBox(height: 10),
                                      TextFormField(
                                        controller: commentController,
                                        keyboardType: TextInputType.multiline,
                                        maxLines: 3,
                                        decoration: InputDecoration(
                                          hintText: "komentar kamu disini",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          context
                                              .read<RestaurantReviewBloc>()
                                              .add(AddRestaurantReviewEvent(
                                                  id: id!,
                                                  rate: ratingStar,
                                                  review:
                                                      commentController.text));
                                          context.pop();
                                        },
                                        child: Text("OK", style: TextStyle(
                                                    color:
                                                        constants.PrimaryColor),)),
                                    TextButton(
                                        onPressed: () {
                                          context.pop();
                                        },
                                        child: Text("Batal", style: TextStyle(
                                                    color:
                                                        constants.PrimaryColor),))
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.add,
                              color: constants.PrimaryColor, size: 24))
                    ],
                  ),
                  SizedBox(height: 6),
                  Container(
                    height: 1,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  if (state.restaurantReview.data!.isEmpty)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text("Belum ada ulasan"),
                      ),
                    ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.restaurantReview.data!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        padding: EdgeInsets.all(12),
                        // height: 130,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(state
                                      .restaurantReview
                                      .data![index]
                                      .user!
                                      .image!
                                      .replaceAll(" ", "")),
                                ),
                                SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        state.restaurantReview.data![index]
                                            .user!.name!,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                    Row(
                                        children: state.restaurantReview
                                                    .data![index].rate! >
                                                0
                                            ? List.generate(
                                                state.restaurantReview
                                                    .data![index].rate!,
                                                (index) => Icon(Icons.star,
                                                    color:
                                                        constants.PrimaryColor,
                                                    size: 16))
                                            : [
                                                Icon(Icons.star_border,
                                                    color:
                                                        constants.PrimaryColor,
                                                    size: 16)
                                              ])
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              state.restaurantReview.data![index].comment!,
                              maxLines: 5,
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          } else if (state is RestaurantReviewError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
