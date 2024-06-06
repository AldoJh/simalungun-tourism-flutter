import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simalungun_tourism/common/const.dart';
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
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    FestivalPage(),
    NewsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    context.read<ProfileBloc>().add(FetchProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _selectedIndex,
        selectedItemColor: constants.PrimaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
