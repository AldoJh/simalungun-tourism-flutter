import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:simalungun_tourism/common/const.dart';
import 'package:simalungun_tourism/common/helper.dart';
import 'package:simalungun_tourism/presentation/bloc/hotel_detail/hotel_detail_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/hotel_review/hotel_review_bloc.dart';
import 'package:simalungun_tourism/presentation/widget/share_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

int? id;

class HotelDetailPage extends StatefulWidget {
  static const routeName = "HotelDetailPage";

  @override
  _HotelDetailPageState createState() => _HotelDetailPageState();
}

class _HotelDetailPageState extends State<HotelDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int activeIndex = 0;
  CarouselController carouselController = CarouselController();
  String latitude = '';
  String longitude = '';

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
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
              log('Could not launch $uri', name: 'HotelDetailPage');
            }
          },
          label: Text("Rute"),
          icon: Icon(Icons.directions)),
      body: BlocConsumer<HotelDetailBloc, HotelDetailState>(
        listener: (context, state) {
          if (state is HotelDetailLoaded) {
            longitude = state.hotelDetail.data!.location!.longitude!;
            latitude = state.hotelDetail.data!.location!.latitude!;
            id = state.hotelDetail.data!.id!.toInt();
          }
        },
        builder: (context, state) {
          if (state is HotelDetailLoaded) {
            if (state.hotelDetail.data!.images!.isEmpty) {
              state.hotelDetail.data!.images!.add(
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
                              state.hotelDetail.data!.share!.facebook!,
                          whatsappShareLink:
                              state.hotelDetail.data!.share!.whatsapp!,
                          linkedinShareLink:
                              state.hotelDetail.data!.share!.linkedin!)
                    ],
                    pinned: false,
                    backgroundColor: Colors.white,
                    expandedHeight: 300.0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        children: [
                          CarouselSlider.builder(
                            carouselController: carouselController,
                            itemCount: state.hotelDetail.data!.images!.length,
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
                                        state.hotelDetail.data!.images![index],
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
                                count: state.hotelDetail.data!.images!.length,
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
                            state.hotelDetail.data!.name!,
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
                                    state.hotelDetail.data!.location!.address!,
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
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                      state.hotelDetail.data!.phone!,
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
                                      state.hotelDetail.data!.rating!.rate! == 0
                                          ? 'Belum ada rating'
                                          : state.hotelDetail.data!.rating!.rate
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
                                state.hotelDetail.data?.description ?? ""),
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[600]),
                          ),
                          SizedBox(height: 20),
                          Text("Fasilitas",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text(
                            state.hotelDetail.data!.facilities!
                                .map((e) => e.name!)
                                .join(', '),
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[600]),
                          ),
                          SizedBox(height: 20),
                          Text("jumlah Kamar",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text(
                            state.hotelDetail.data!.roomCount!,
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[600]),
                          ),
                          SizedBox(height: 20),
                          Text("harga",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text(
                            Helper.rupiahFormat(state
                                    .hotelDetail.data!.price!.min!
                                    .toInt()) +
                                ' - ' +
                                Helper.rupiahFormat(state
                                    .hotelDetail.data!.price!.max!
                                    .toInt()),
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  reviewTabbar(),
                ],
              ),
            );
          } else if (state is HotelDetailError) {
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

class reviewTabbar extends StatelessWidget {
  int ratingStar = 5;
  TextEditingController commentController = TextEditingController();
  reviewTabbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<HotelReviewBloc, HotelReviewState>(
        listener: (context, state) {
          if (state is HotelReviewAdded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Ulasan berhasil ditambahkan"),
              ),
            );
            context.read<HotelReviewBloc>().add(FetchHotelReviewEvent(id: id!));
          }
        },
        builder: (context, state) {
          if (state is HotelReviewLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Ulasan (${state.hotelReview.data!.length})",
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
                                          context.read<HotelReviewBloc>().add(
                                              AddHotelReviewEvent(
                                                  id: id!,
                                                  rate: ratingStar,
                                                  review:
                                                      commentController.text));
                                          context.pop();
                                        },
                                        child: Text(
                                          "OK",
                                          style: TextStyle(
                                              color: constants.PrimaryColor),
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          context.pop();
                                        },
                                        child: Text(
                                          "Batal",
                                          style: TextStyle(
                                              color: constants.PrimaryColor),
                                        ))
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
                  if (state.hotelReview.data!.isEmpty)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text("Belum ada ulasan"),
                      ),
                    ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.hotelReview.data!.length,
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
                                      .hotelReview.data![index].user!.image!
                                      .replaceAll(" ", "")),
                                ),
                                SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        state.hotelReview.data![index].user!
                                            .name!,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                    Row(
                                        children: state.hotelReview.data![index]
                                                    .rate! >
                                                0
                                            ? List.generate(
                                                state.hotelReview.data![index]
                                                    .rate!,
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
                              state.hotelReview.data![index].comment!,
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
          } else if (state is HotelReviewError) {
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
