import 'package:flutter/material.dart';
import 'package:knustforum/frontend/widgets/small_text.dart';
import 'package:knustforum/frontend/widgets/text_button.dart';

class TabletNavBar extends StatelessWidget {
  final double width;
  const TabletNavBar({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
      child: SizedBox(
        height: 120,
        width: width,
        // color: Colors.yellow,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80,
                    width: 50,
                    child: Image.asset('assets/images/knust_ghana.png'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const AppSmallText(
                    text: 'KNUST FORUM',
                    size: 30,
                    color: Colors.black,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    text: 'Profile',
                    onPressed: () {},
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
