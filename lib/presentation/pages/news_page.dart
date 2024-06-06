import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:simalungun_tourism/common/helper.dart';
import 'package:simalungun_tourism/presentation/bloc/news/news_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/news_detail/news_detail_bloc.dart';
import 'package:simalungun_tourism/presentation/pages/news_detail_page.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    context.read<NewsBloc>().add(FetchNewsEvent(query: ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Berita',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          surfaceTintColor: Colors.transparent),
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
                  context.read<NewsBloc>().add(FetchNewsEvent(query: value));
                },
                controller: _searchController,
                decoration: InputDecoration(
                    prefixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.search)),
                    hoverColor: const Color(0xffF7F7F7),
                    fillColor: const Color(0xffF7F7F7),
                    hintText: "Cari Berita",
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<NewsBloc, NewsState>(
                builder: (context, state) {
                  if (state is NewsLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is NewsError) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else if (state is NewsLoaded) {
                    return ListView.builder(
                      controller: _scrollController
                        ..addListener(() {
                          if (_scrollController.position.pixels ==
                              _scrollController.position.maxScrollExtent) {
                            context.read<NewsBloc>().add(FetchMoreNewsEvent());
                          }
                        }),
                      itemCount: state.news.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            context.read<NewsDetailBloc>().add(
                                FetchNewsDetailEvent(
                                    id: state.news[index].id!));
                            context.goNamed(NewsDetailPage.routeName);
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
                                          state.news[index].image.toString()),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.news[index].title.toString(),
                                      maxLines: 3,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xff000000)),
                                    ),
                                    Text(
                                      Helper.contentText(
                                          state.news[index].content.toString()),
                                      maxLines: 3,
                                      // textAlign: TextAlign.justify,
                                      style: TextStyle(fontSize: 11),
                                    ),
                                    Text(
                                      DateFormat("EEEE, d MMMM yyyy", "id_ID")
                                          .format(DateTime.parse(state
                                              .news[index].createdAt
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
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
