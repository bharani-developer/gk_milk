import 'package:flutter/material.dart';

import 'package:gk_milk/screens/AuthScreen/addprofile_screen.dart';
import 'package:gk_milk/screens/AuthScreen/forget_password_screen.dart';
import 'package:gk_milk/screens/AuthScreen/register_screen.dart';
import 'package:gk_milk/screens/AuthScreen/verification_screen.dart';
import 'package:gk_milk/screens/AuthScreen/login_screen.dart';
import 'package:gk_milk/screens/DrawerScreen/AccountScreen/adressmanager_screen.dart';
import 'package:gk_milk/screens/DrawerScreen/AccountScreen/offers_screen.dart';
import 'package:gk_milk/screens/DrawerScreen/OrderScreen/orderlist_screen.dart';
import 'package:gk_milk/screens/DrawerScreen/SettingsScreen/settings_screen.dart';
import 'package:gk_milk/screens/SplashScreen/splash_screen.dart';
import 'package:gk_milk/screens/WalkthroughScreen/walkthrough_screen.dart';

const String splashscreenRoute = '/';
const String walkthroughRoute = '/walkthroughscreen';
const String loginscreenRoute = '/loginscreen';
const String registerscreenRoute = '/registerscreen';
const String addprofilescreenRoute = '/addprofilescreen';
const String verificationscreenRoute = '/verificationcreen';
const String dashboardscreenRoute = '/dashboardcreen';
const String forgetpassword = '/forgetpassword';
const String addressmanagerscreenRoute = '/addressmanager';
const String myofferscreenRoute = '/myoffer';
const String myorderscreenRoute = '/myorder';
const String settingscreenRoute = '/setting';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashscreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case walkthroughRoute:
        return MaterialPageRoute(builder: (_) => const WalkThroughScreen());
      case loginscreenRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case registerscreenRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case addprofilescreenRoute:
        return MaterialPageRoute(builder: (_) => const AddProfileScreen());
      case verificationscreenRoute:
        return MaterialPageRoute(builder: (_) => const VerificationScreen());
      case forgetpassword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case addressmanagerscreenRoute:
        return MaterialPageRoute(builder: (_) => const AddressManagerScreen());
      case myofferscreenRoute:
        return MaterialPageRoute(builder: (_) => const OffersScreen());
      case myorderscreenRoute:
        return MaterialPageRoute(builder: (_) => const OrderListScreen());
      case settingscreenRoute:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: const Center(
          child: Text('Home'),
        ),
      );
    });
  }
}
