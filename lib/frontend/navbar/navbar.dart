import 'package:flutter/material.dart';
import 'package:knustforum/frontend/navbar/dekstop_nav_bar.dart';
import 'package:knustforum/frontend/navbar/tablet_nav_bar.dart';

import 'mobile_navbar.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1200) {
        return DesktopNavBar(width: constraints.biggest.width);
      } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
        return TabletNavBar(width: constraints.biggest.width);
      } else {
        return MobileNavBar(
          width: constraints.biggest.width,
        );
      }
    });
  }
}
