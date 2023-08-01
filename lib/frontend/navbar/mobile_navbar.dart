import 'package:flutter/material.dart';
import 'package:knustforum/frontend/widgets/small_text.dart';
import 'package:knustforum/frontend/widgets/text_button.dart';

class MobileNavBar extends StatelessWidget {
  final double width;
  const MobileNavBar({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SizedBox(
        height: 80,
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                    children: [
                      AppTextButton(
                        text: 'Home',
                        onPressed: () {},
                        color: Colors.black,
                        size: 25,
                      ),
                      AppTextButton(
                        text: 'Forum',
                        onPressed: () {
                          //TODO: Navigate to the forums page
                        },
                        color: Colors.black,
                        size: 25,
                      ),
                      AppTextButton(
                        text: 'Help',
                        onPressed: () {
                          //TODO: Show the help popup
                        },
                        color: Colors.black,
                        size: 25,
                      ),
                      AppTextButton(
                        text: 'Profile',
                        onPressed: () {
                          //TODO: Show the profile popup
                        },
                        color: Colors.black,
                        size: 25,
                      ),
                    ],
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
