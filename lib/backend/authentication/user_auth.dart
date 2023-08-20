import 'package:firebase_auth/firebase_auth.dart';
import 'package:knustforum/database/all_messages.dart';

import '../models/users_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Convert a user from Firebase to a custom user
  CustomUser? _convertUser(User? user) {
    if (user != null) {
      return CustomUser(uid: user.uid, email: user.email!);
    }
    return null;
  }

  //Listening for auth changes, i.e checking if a user is logged in or out
  Stream<CustomUser?> get authenticatedUser {
    return _auth.authStateChanges().map(_convertUser);
  }

  // Register  user with email and password
  Future<CustomUser?> registerWithEmailAndPassword(
      String email, String password, String username) async {
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //create a message collection for each user when the first sign up
      await AllMessageDB().saveMessage('', DateTime.now(), email);
      return _convertUser(user.user);
    } catch (e) {
      // TODO: Display a container with a formatted error message
      return null;
    }
  }

  // Login with email and password
  Future<CustomUser?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // Convert the user to the custom user, accessing only the uid and email and return it
      return _convertUser(user.user);
    } catch (e) {
      print(e.toString());
      // TODO: Display a container with a formatted error message
      return null;
    }
  }

  //Logout
  Future logout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
