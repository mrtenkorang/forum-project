import 'package:flutter/material.dart';

import 'desktop_forum_view.dart';

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
          return const DesktopForum();
        } else {
          return const DesktopForum();
        }
      }),
    );
  }
}
