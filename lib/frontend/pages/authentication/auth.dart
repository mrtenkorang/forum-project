import 'package:flutter/material.dart';
import 'package:knustforum/frontend/pages/authentication/login_signup.dart';

import 'mobile_login_signup.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.biggest.width >= 1200 ||
          (constraints.biggest.width < 1200 &&
              constraints.biggest.width > 800)) {
        return const LoginAndSignUp();
      } else {
        return const MobileLoginSignup();
      }
    });
  }
}
