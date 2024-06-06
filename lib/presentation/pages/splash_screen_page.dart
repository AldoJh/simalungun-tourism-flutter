import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simalungun_tourism/presentation/pages/bottom_nav_page.dart';

class SplashScreenpage extends StatefulWidget {
  static const routeName = '/splash_screen';

  const SplashScreenpage({super.key});

  @override
  State<SplashScreenpage> createState() => _SplashScreenpageState();
}

class _SplashScreenpageState extends State<SplashScreenpage> {


  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 2), () {
      context.go(BottomNavpage.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 228,
          child: Image.asset('assets/img/logo.png'),
        ),
      ),
    );
  }
}
