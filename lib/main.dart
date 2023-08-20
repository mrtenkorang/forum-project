import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:knustforum/backend/authentication/user_auth.dart';
import 'package:knustforum/frontend/providers/course_name_provider.dart';
import 'package:knustforum/navigation.dart';
import 'package:provider/provider.dart';

import 'backend/models/users_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBE0tVw4vK5__ZGOg2gCUewqZs8QzgPE_I",
      authDomain: "forum-d280d.firebaseapp.com",
      projectId: "forum-d280d",
      storageBucket: "forum-d280d.appspot.com",
      messagingSenderId: "561349684925",
      appId: "1:561349684925:web:1103ad4f961784021c51d4",
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CourseNameProvider()),
      ],
      child: const KnustForum(),
    ),
  );
}

class KnustForum extends StatelessWidget {
  const KnustForum({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CustomUser?>.value(
      value: AuthService().authenticatedUser,
      initialData: null,
      child: MaterialApp.router(
        routerConfig: Navigation().router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme:
              Theme.of(context).colorScheme.copyWith(secondary: Colors.green),
          textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
          //useMaterial3: true,
        ),
      ),
    );
  }
}
