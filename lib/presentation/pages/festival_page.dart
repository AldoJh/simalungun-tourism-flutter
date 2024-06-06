import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:simalungun_tourism/presentation/bloc/festival/festival_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/festival_detail/festival_detail_bloc.dart';
import 'package:simalungun_tourism/presentation/pages/festival_detail_page.dart';

class FestivalPage extends StatefulWidget {
  const FestivalPage({super.key});

  @override
  State<FestivalPage> createState() => _FestivalPageState();
}

class _FestivalPageState extends State<FestivalPage> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    context.read<FestivalBloc>().add(FetchFestivalEvent(query: ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Festival',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xffF7F7F7),
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextField(
                onChanged: (value) {
                  context
                      .read<FestivalBloc>()
                      .add(FetchFestivalEvent(query: value));
                },
                controller: _searchController,
                decoration: InputDecoration(
                    prefixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.search)),
                    hoverColor: const Color(0xffF7F7F7),
                    fillColor: const Color(0xffF7F7F7),
                    hintText: "Cari Festival",
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: BlocBuilder<FestivalBloc, FestivalState>(
                builder: (context, state) {
                  if (state is FestivalLoaded) {
                    return ListView.builder(
                      controller: _scrollController
                        ..addListener(() {
                          if (_scrollController.offset >=
                                  _scrollController.position.maxScrollExtent &&
                              !_scrollController.position.outOfRange) {
                            context
                                .read<FestivalBloc>()
                                .add(fetchMoreFestivalEvent());
                          }
                        }),
                      itemCount: state.festival.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.read<FestivalDetailBloc>().add(
                                FetchFestivalDetailEvent(
                                    id: state.festival[index].id!));
                            context.goNamed(FestivalDetailPage.routeName);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 131,
                                  height: 120,
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          state.festival[index].image!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.festival[index].name!,
                                      maxLines: 3,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xff000000)),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      state.festival[index].description!,
                                      maxLines: 3,
                                      style: TextStyle(fontSize: 11),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      DateFormat("EEEE, d MMMM yyyy", "id_ID")
                                          .format(DateTime.parse(state
                                              .festival[index].createdAt
                                              .toString())),
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.grey),
                                    )
                                  ],
                                ))
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is FestivalError) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
