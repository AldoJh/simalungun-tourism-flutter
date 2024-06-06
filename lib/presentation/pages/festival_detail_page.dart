import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:simalungun_tourism/common/const.dart';
import 'package:simalungun_tourism/common/helper.dart';
import 'package:simalungun_tourism/presentation/bloc/festival_detail/festival_detail_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class FestivalDetailPage extends StatelessWidget {
  static const String routeName = 'festival-detail';
  const FestivalDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FestivalDetailBloc, FestivalDetailState>(
        builder: (context, state) {
          if (state is FestivalDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FestivalDetailLoaded) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: Container(),
                  expandedHeight: 580,
                  floating: false,
                  pinned: false,
                  bottom: PreferredSize(
                      preferredSize: Size.fromHeight(100),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.festival!.data!.name!,
                                  maxLines: 3,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Simalungun Tourism",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Icon(
                                      Icons.circle,
                                      color: Colors.white,
                                      size: 10,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      Helper.dateText(
                                          state.festival!.data!.date!),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30),
                              ),
                            ),
                          )
                        ],
                      )),
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.5),
                              BlendMode.darken,
                            ),
                            image: NetworkImage(
                              state.festival!.data!.image!,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: SafeArea(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 16.0),
                            child: Stack(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          Colors.white.withOpacity(0.3),
                                      child: IconButton(
                                        icon: Icon(Icons.arrow_back),
                                        color: Colors.black,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                    CircleAvatar(
                                      backgroundColor:
                                          Colors.white.withOpacity(0.3),
                                      child: IconButton(
                                        icon: Icon(Icons.share),
                                        color: Colors.black,
                                        onPressed: () {
                                          showModalBottomSheet<void>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return SizedBox(
                                                height: 350,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 24,
                                                      top: 24,
                                                      right: 24),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        'Mau Bagikan\nKe mana?',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(height: 28),
                                                      GestureDetector(
                                                        onTap: () async {
                                                          var url = Uri.parse(
                                                              state
                                                                  .festival!
                                                                  .data!
                                                                  .share!
                                                                  .facebook!);
                                                          if (await canLaunchUrl(
                                                              url)) {
                                                            launchUrl(url);
                                                          }
                                                        },
                                                        child: Container(
                                                          height: 56,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .grey,
                                                                  width: 1.0),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Row(
                                                            children: [
                                                              SizedBox(
                                                                  width: 24),
                                                              Image.asset(
                                                                "assets/icons/facebook.png",
                                                                width: 24,
                                                                height: 24,
                                                              ),
                                                              SizedBox(
                                                                  width: 24),
                                                              Text(
                                                                "Facebook",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Spacer(),
                                                              Icon(
                                                                Icons
                                                                    .arrow_forward_ios_rounded,
                                                                color:
                                                                    Colors.grey,
                                                                size: 16,
                                                              ),
                                                              SizedBox(
                                                                  width: 24),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 16),
                                                      GestureDetector(
                                                        onTap: () async {
                                                          var url = Uri.parse(
                                                              state
                                                                  .festival!
                                                                  .data!
                                                                  .share!
                                                                  .whatsapp!);
                                                          if (await canLaunchUrl(
                                                              url)) {
                                                            launchUrl(url);
                                                          }
                                                        },
                                                        child: Container(
                                                          height: 56,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .grey,
                                                                  width: 1.0),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Row(
                                                            children: [
                                                              SizedBox(
                                                                  width: 24),
                                                              Image.asset(
                                                                "assets/icons/whatsapp.png",
                                                                width: 24,
                                                                height: 24,
                                                              ),
                                                              SizedBox(
                                                                  width: 24),
                                                              Text(
                                                                "Whatsapp",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Spacer(),
                                                              Icon(
                                                                Icons
                                                                    .arrow_forward_ios_rounded,
                                                                color:
                                                                    Colors.grey,
                                                                size: 16,
                                                              ),
                                                              SizedBox(
                                                                  width: 24),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 16),
                                                      GestureDetector(
                                                        onTap: () async {
                                                          var url = Uri.parse(
                                                              state
                                                                  .festival!
                                                                  .data!
                                                                  .share!
                                                                  .linkedin!);
                                                          if (await canLaunchUrl(
                                                              url)) {
                                                            launchUrl(url);
                                                          }
                                                        },
                                                        child: Container(
                                                          height: 56,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .grey,
                                                                  width: 1.0),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Row(
                                                            children: [
                                                              SizedBox(
                                                                  width: 24),
                                                              Image.asset(
                                                                "assets/icons/linkedin.png",
                                                                width: 24,
                                                                height: 24,
                                                              ),
                                                              SizedBox(
                                                                  width: 24),
                                                              Text(
                                                                "Linkedin",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Spacer(),
                                                              Icon(
                                                                Icons
                                                                    .arrow_forward_ios_rounded,
                                                                color:
                                                                    Colors.grey,
                                                                size: 16,
                                                              ),
                                                              SizedBox(
                                                                  width: 24),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.date_range,
                                      color: constants.PrimaryColor,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Tanggal",
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text(
                                  DateFormat("d MMM yyyy", "id_ID").format(
                                      DateTime.parse(
                                          state.festival!.data!.date!)),
                                  style: TextStyle(
                                      fontSize: 16,
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
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.handshake,
                                      color: constants.PrimaryColor,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Tiket Masuk",
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text(
                                  state.festival!.data!.price! == 0
                                      ? "Gratis"
                                      : Helper.rupiahFormat(
                                          state.festival!.data!.price!),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            children: [
                              Icon(Icons.location_on,
                                  color: constants.PrimaryColor),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  state.festival!.data!.location!.address!,
                                  style: TextStyle(fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            Helper.contentText(
                                state.festival!.data!.description!),
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.5,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 10,
                                blurRadius: 15,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              final uri = Uri(
                                  scheme: "google.navigation",
                                  // host: '"0,0"',  {here we can put host}
                                  queryParameters: {
                                    'q':
                                        '${state.festival!.data!.location!.latitude}, ${state.festival!.data!.location!.longitude}'
                                  });
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri);
                              } else {
                                log('Could not launch $uri',
                                    name: 'TourDetailPage');
                              }
                            },
                            icon: Icon(Icons.route, color: Colors.white),
                            label: Text("Rute",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(105, 49),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              backgroundColor: constants.PrimaryColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                )
              ],
            );
          } else if (state is FestivalDetailError) {
            return Center(
              child: Text(state.message),
            );
          }
          return Container();
        },
      ),
    );
  }
}
