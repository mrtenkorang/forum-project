import 'package:flutter/material.dart';
import 'package:knustforum/frontend/forum/tablet_view.dart';

import 'desktop_forum_view.dart';
import 'mobile_view.dart';

class Forum extends StatelessWidget {
  const Forum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return DesktopForum(
            width: constraints.biggest.width,
            //height: constraints.biggest.height
          );
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return TabletForum(width: constraints.biggest.width);
        } else {
          return MobileForum(width: constraints.biggest.width);
        }
      }),
    );
  }
}
