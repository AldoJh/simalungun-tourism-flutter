import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simalungun_tourism/common/const.dart';
import 'package:simalungun_tourism/common/helper.dart';
import 'package:simalungun_tourism/presentation/bloc/news_detail/news_detail_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailPage extends StatelessWidget {
  static const routeName = "news-detail";
  NewsDetailPage({super.key});

  TextEditingController? CommentController = TextEditingController();
  int? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<NewsDetailBloc, NewsDetailState>(
        listener: (context, state) {
          if (state is NewsDetailLoaded) {
            id = state.newsDetail!.data!.id;
          }
          if (state is NewsCommentLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Komentar berhasil ditambahkan"),
              ),
            );
            context.read<NewsDetailBloc>().add(FetchNewsDetailEvent(id: id!));
          }
        },
        builder: (context, state) {
          log('state: $state', name: 'NewsDetailPage');
          if (state is NewsDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NewsDetailLoaded) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: Container(),
                  expandedHeight: 580,
                  floating: false,
                  pinned: false,
                  bottom: PreferredSize(
                      preferredSize: Size.fromHeight(120),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.newsDetail!.data!.title!,
                                  maxLines: 3,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.newsDetail!.data!.author!.name!,
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
                                          state.newsDetail!.data!.date!),
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
                              state.newsDetail!.data!.image!,
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
                                        color: Colors.black,
                                        icon: Icon(Icons.arrow_back),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                    CircleAvatar(
                                      backgroundColor:
                                          Colors.white.withOpacity(0.3),
                                      child: IconButton(
                                        color: Colors.black,
                                        icon: Icon(Icons.share),
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
                                                                  .newsDetail!
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
                                                                  .newsDetail!
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
                                                                  .newsDetail!
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
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Text(
                            Helper.contentText(
                                state.newsDetail!.data!.content!),
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Text(
                                "Komentar (${state.newsDetail!.data!.comment!.length})",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.white,
                                          surfaceTintColor: Colors.white,
                                          title: Text("Tambah Komentar"),
                                          content: TextFormField(
                                            controller: CommentController,
                                            maxLines: 3,
                                            decoration: InputDecoration(
                                              hintText: "Masukkan komentar",
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Batal",
                                                style: TextStyle(
                                                    color:
                                                        constants.PrimaryColor),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                context
                                                    .read<NewsDetailBloc>()
                                                    .add(AddNewsCommentEvent(
                                                        newsId: id!,
                                                        content:
                                                            CommentController!
                                                                .text));
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Kirim",
                                                style: TextStyle(
                                                    color:
                                                        constants.PrimaryColor),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    Icons.add_comment,
                                    color: constants.PrimaryColor,
                                  )),
                            ],
                          ),
                          SizedBox(height: 6),
                          Container(
                            height: 1,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          if (state.newsDetail!.data!.comment!.isEmpty)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text("Belum ada komentar"),
                              ),
                            ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.newsDetail!.data!.comment!.length,
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
                                              .newsDetail!
                                              .data!
                                              .comment![index]
                                              .user!
                                              .image!
                                              .replaceAll(" ", "")),
                                        ),
                                        SizedBox(width: 12),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                state
                                                    .newsDetail!
                                                    .data!
                                                    .comment![index]
                                                    .user!
                                                    .name!,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      state.newsDetail!.data!.comment![index]
                                          .content!,
                                      maxLines: 5,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600]),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      )),
                )
              ],
            );
          } else if (state is NewsDetailError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        },
      ),
    );
  }
}
