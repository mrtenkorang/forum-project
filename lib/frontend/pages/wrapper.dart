import 'package:flutter/material.dart';
import 'package:knustforum/backend/models/users_model.dart';
import 'package:knustforum/frontend/pages/authentication/auth.dart';
import 'package:knustforum/frontend/pages/home_page.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);
    return user != null ? const HomePage() : const AuthenticationPage();
  }
}
