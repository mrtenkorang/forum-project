import 'package:flutter/material.dart';
import 'package:knustforum/frontend/forum/forum.dart';

void main() async {
  runApp(const KnustForum());
}

class KnustForum extends StatelessWidget {
  const KnustForum({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            Theme.of(context).colorScheme.copyWith(secondary: Colors.green),
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
        //useMaterial3: true,
      ),
      home: const Forum(),
    );
  }
}
