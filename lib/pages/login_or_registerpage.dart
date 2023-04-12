import 'package:easueuth/pages/login_page.dart';
import 'package:flutter/material.dart';

import 'Registerpage.dart';

class LoginOrRegisterPager extends StatefulWidget {
  const LoginOrRegisterPager({super.key});

  @override
  State<LoginOrRegisterPager> createState() => _LoginOrRegisterPagerState();
}

class _LoginOrRegisterPagerState extends State<LoginOrRegisterPager> {
  // intially show login page
  bool showLoginPage = true;

  // toggle between login and register page
  void togglepPage() {
    print('ontap');
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage == true) {
      return LoginPage(
        pa: togglepPage,
      );
    } else {
      return RegisterPage(
        pa: togglepPage,
      );
    }
  }
}
