import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simalungun_tourism/common/const.dart';
import 'package:simalungun_tourism/presentation/bloc/tour/tour_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/tour_detail/tour_detail_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/tour_guide/tour_guide_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/tour_review/tour_review_bloc.dart';
import 'package:simalungun_tourism/presentation/pages/tour_detail_page.dart';

class TourPage extends StatefulWidget {
  static const routeName = "tour";
  TourPage({super.key});

  @override
  State<TourPage> createState() => _TourPageState();
}

class _TourPageState extends State<TourPage> {
  TextEditingController searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    context.read<TourBloc>().add(FetchTourEvent(query: ""));
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
                          .read<TourBloc>()
                          .add(FetchTourEvent(query: value));
                    },
                    decoration: InputDecoration(
                        hintText: 'Cari Lokasi Wisata',
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
        BlocBuilder<TourBloc, TourState>(
          builder: (context, state) {
            if (state is TourLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TourError) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is TourLoaded) {
              return Expanded(
                child: GridView.builder(
                  controller: _scrollController
                    ..addListener(() {
                      if (_scrollController.offset >=
                              _scrollController.position.maxScrollExtent &&
                          !_scrollController.position.outOfRange) {
                        context.read<TourBloc>().add(FetchMoreTourEvent());
                      }
                    }),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.7),
                  itemCount: state.tours.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.read<TourDetailBloc>().add(FetchTourDetailEvent(
                            id: state.tours[index].id!.toInt()));
                        context.read<TourReviewBloc>().add(FetchTourReviewEvent(
                            id: state.tours[index].id!.toInt()));
                        context.read<TourGuideBloc>().add(FetchTourGuideEvent(
                            id: state.tours[index].id!.toInt()));
                        context.goNamed(TourDetailPage.routeName);
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
                                          state.tours[index].image!),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              padding: EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.tours[index].name!,
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
                                        state.tours[index].rating!.rate!
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
