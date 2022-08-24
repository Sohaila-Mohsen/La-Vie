import 'dart:async';

import 'package:flutter/material.dart';
import 'package:la_vie/core/components/logo.dart';
import 'package:la_vie/core/utils/navigation.dart';
import 'package:la_vie/views/home_screen.dart';
import 'package:la_vie/views/login_screen.dart';
import 'package:la_vie/views/scan_screen.dart';
import 'package:la_vie/views/sign_up_screen.dart';

import '../core/utils/sp_helper/cache_helper.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({Key? key}) : super(key: key);

  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Logo(136),
      ),
    );
  }

  startTime() async {
    var duration = const Duration(seconds: 10);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      if (SharedPreferencesHelper.getData(key: "accessToken") == null)
        return LoginScreen();
      else
        return HomeScreen();
    }), (route) => true);
  }
}
