import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:knustforum/backend/authentication/user_auth.dart';
import 'package:knustforum/frontend/widgets/small_text.dart';
import 'package:knustforum/frontend/widgets/text_button.dart';

class DesktopNavBar extends StatelessWidget {
  final double width;
  const DesktopNavBar({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 250, vertical: 20),
      child: SizedBox(
        height: 80,
        width: width,
        // color: Colors.yellow,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80,
                    width: 50,
                    child: Image.asset('assets/images/knust_ghana.png'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  AppSmallText(
                    text: 'KNUST FORUM',
                    size: 30,
                    color: Colors.black,
                  ),
                ],
              ),
              Row(
                children: [
                  AppTextButton(
                    text: 'Home',
                    onPressed: () {},
                    color: Colors.black,
                    size: 25,
                  ),
                  AppTextButton(
                    text: 'Forum',
                    onPressed: () {},
                    color: Colors.black,
                    size: 25,
                  ),
                  AppTextButton(
                    text: 'Help',
                    onPressed: () {},
                    color: Colors.black,
                    size: 25,
                  ),
                  AppTextButton(
                    text: 'Logout',
                    onPressed: () async {
                      await AuthService().logout();
                      context.goNamed('/');
                    },
                    color: Colors.black,
                    size: 25,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
