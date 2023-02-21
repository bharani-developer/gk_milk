// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:gk_milk/models/app_model.dart';
import 'package:gk_milk/services/app_service.dart';
import 'package:gk_milk/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  static String tag = '/SplashScreen';

  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  Appconfig? appconfig;
  fetchData() async {
    var model = await loadConfig();
    setState(() {
      appconfig = model;
    });
  }

  @override
  void initState() {
    super.initState();
    init();
    fetchData();
  }

  Future<void> init() async {
    setStatusBarColor(whitePureColor, statusBarIconBrightness: Brightness.dark);
    await Future.delayed(const Duration(seconds: 7));
    if (mounted) finish(context);
    Navigator.pushNamed(context, '/walkthroughscreen');
  }

  @override
  void dispose() {
    setStatusBarColor(Colors.white, statusBarIconBrightness: Brightness.dark);
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                appconfig!.splashlogo[0].image,
                fit: BoxFit.fill,
                height: 150,
                width: 150,
              ).center(),
            ],
          ),
        ),
      ),
    );
  }
}
