import 'package:flutter/material.dart';

import '../frontend/widgets/app_button.dart';
import '../frontend/widgets/big_text.dart';
import '../frontend/widgets/small_text.dart';

class DesktopBody extends StatelessWidget {
  final double? width;
  const DesktopBody(this.width, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<CustomUser?>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 250),
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
                  Row(
                    children: [
                      AppButton(
                        onPressed: () {
                          // user == null
                          //     ? showDialog(
                          //         context: context,
                          //         builder: (BuildContext context) {
                          //           return const LoginPopup();
                          //         },
                          //       )
                          //     : GoRouter.of(context)
                          //         .goNamed(AppRouteConstants.bookTicketName);
                        },
                        buttonLabelText: 'Book Ticket',
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
                      AppButton(
                        onPressed: () {
                          // user == null
                          //     ? showDialog(
                          //         context: context,
                          //         builder: (BuildContext context) {
                          //           return const LoginPopup();
                          //         },
                          //       )
                          //     : GoRouter.of(context)
                          //         .goNamed(AppRouteConstants.complaintName);
                        },
                        buttonLabelText: 'Complaint',
                        textSize: 20,
                        textColor: Colors.green,
                        buttonHeight: 70,
                        backgroundColor: Colors.white,
                        borderColor: Colors.green,
                        buttonRadius: 50,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: width! / 4,
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
        ],
      ),
    );
  }
}
