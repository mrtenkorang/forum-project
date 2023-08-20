import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/app_button.dart';
import '../widgets/big_text.dart';
import '../widgets/small_text.dart';

class DesktopBody extends StatelessWidget {
  final double width;
  //final double height;
  const DesktopBody({
    Key? key,
    this.width = 0.0,
    //this.height = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<CustomUser?>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 200),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BigText(
                    text: 'Education Revisioned',
                    bigTextSize: 50,
                    textColor: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const AppSmallText(
                    text:
                        'Get help with questions proven to be unsolvable\nthrough discussions',
                    size: 18,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AppButton(
                    onPressed: () {
                      context.goNamed('forum');
                    },
                    buttonLabelText: 'Forum',
                    textSize: 20,
                    textColor: Colors.white,
                    buttonHeight: 70,
                    backgroundColor: Colors.green,
                    borderColor: Colors.green,
                    buttonRadius: 50,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
              SizedBox(
                width: width / 4,
                child: const Image(
                  image: AssetImage(
                    'assets/images/edu.jpg',
                  ),
                ),
              ),
            ],
          ),
          // const SizedBox(
          //   height: 60,
          // ),
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
