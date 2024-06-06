import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simalungun_tourism/common/const.dart';
import 'package:simalungun_tourism/presentation/bloc/hotel/hotel_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/hotel_detail/hotel_detail_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/hotel_review/hotel_review_bloc.dart';
import 'package:simalungun_tourism/presentation/pages/hotel_detail_page.dart';

class HotelPage extends StatefulWidget {
  static const routeName = "Hotel";
  HotelPage({super.key});

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  TextEditingController searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    context.read<HotelBloc>().add(FetchHotelEvent(query: ""));
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: 138,
          decoration: BoxDecoration(color: constants.PrimaryColor),
          child: SafeArea(
            child: Container(
              height: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white.withOpacity(0.2),
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                      child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      context
                          .read<HotelBloc>()
                          .add(FetchHotelEvent(query: value));
                    },
                    decoration: InputDecoration(
                        hintText: 'Cari Hotel',
                        prefixIcon: Icon(Icons.search),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide.none),
                        hoverColor: Colors.white,
                        fillColor: Colors.white,
                        filled: true),
                  ))
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        BlocBuilder<HotelBloc, HotelState>(
          builder: (context, state) {
            if (state is HotelLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HotelError) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is HotelLoaded) {
              return Expanded(
                child: GridView.builder(
                  controller: _scrollController
                    ..addListener(() {
                      if (_scrollController.offset >=
                              _scrollController.position.maxScrollExtent &&
                          !_scrollController.position.outOfRange) {
                        context.read<HotelBloc>().add(FetchMoreHotelEvent());
                      }
                    }),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.7),
                  itemCount: state.hotels.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context
                            .read<HotelDetailBloc>()
                            .add(FetchHotelDetailEvent(id: state.hotels[index].id!.toInt()));
                        context
                            .read<HotelReviewBloc>()
                            .add(FetchHotelReviewEvent(id: state.hotels[index].id!.toInt()));
                        context.goNamed(HotelDetailPage.routeName);
                      },
                      child: Container(
                        height: 222,
                        width: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(0, 2))
                            ]),
                        child: Column(
                          children: [
                            Container(
                              height: 156,
                              width: 180,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16),
                                  ),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          state.hotels[index].image!),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              padding: EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.hotels[index].name!,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: constants.PrimaryColor,
                                        size: 14,
                                      ),
                                      SizedBox(width: 12),
                                      Text(
                                        state.hotels[index].rating!.rate!
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        )
      ],
    ));
  }
}
