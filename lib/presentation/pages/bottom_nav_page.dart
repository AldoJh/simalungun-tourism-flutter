import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simalungun_tourism/common/const.dart';
import 'package:simalungun_tourism/presentation/bloc/bottom_nav/bottom_nav_bloc.dart';
import 'package:simalungun_tourism/presentation/bloc/profile/profile_bloc.dart';
import 'package:simalungun_tourism/presentation/pages/home_page.dart';
import 'package:simalungun_tourism/presentation/pages/news_page.dart';
import 'package:simalungun_tourism/presentation/pages/festival_page.dart';
import 'package:simalungun_tourism/presentation/pages/profile_page.dart';

class BottomNavpage extends StatefulWidget {
  static const routeName = "/home";

  const BottomNavpage({super.key});

  @override
  State<BottomNavpage> createState() => _BottomNavpageState();
}

class _BottomNavpageState extends State<BottomNavpage> {
  GlobalKey _bottomNavigationKey = GlobalKey();

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    FestivalPage(),
    NewsPage(),
    ProfilePage(),
  ];


  @override
  void initState() {
    context.read<ProfileBloc>().add(FetchProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(state is BottomNavChanged ? state.index : 0),
          ),
          bottomNavigationBar: BottomNavigationBar(
            key: _bottomNavigationKey,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.rocket),
                label: 'Festival',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.news),
                label: 'Berita',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: state is BottomNavChanged ? state.index : 0,
            selectedItemColor: constants.PrimaryColor,
            unselectedItemColor: Colors.grey,
            onTap:(value) => context.read<BottomNavBloc>().add(ChangeBottomNavEvent(value)),
          ),
        );
      },
    );
  }
}
