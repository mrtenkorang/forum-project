import 'package:flutter/material.dart';

import '../body/body.dart';
import '../navbar/navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavBar(),
            SizedBox(
              height: 80,
            ),
            AppBody(),
          ],
        ),
      ),
    );
  }
}
