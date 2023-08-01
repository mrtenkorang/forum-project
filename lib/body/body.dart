import 'package:flutter/material.dart';
import 'package:knustforum/body/tablet_body.dart';

import 'desktop_body.dart';
import 'mobile_body.dart';

class AppBody extends StatelessWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1200) {
        return DesktopBody(constraints.biggest.width);
      } else if (constraints.maxWidth > 800 && constraints.maxWidth < 200) {
        return const TabletBody();
      } else {
        return const MobileBody();
      }
    });
  }
}
