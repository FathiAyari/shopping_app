import 'package:firebase_auth/firebase_auth.dart';

import '../models/Users.dart';
import 'DbServices.dart';

class AuthServices {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<bool> signIn(String emailController, String passwordController) async {
    try {
      await auth.signInWithEmailAndPassword(email: emailController, password: passwordController);
      print("done");
      return true;
    } on FirebaseException catch (e) {
      print(e.message);
      return false;
    }
  }

  Future<bool> signUp(String Name, String emailController, String passwordController, String GsmController) async {
    try {
      await auth.createUserWithEmailAndPassword(email: emailController, password: passwordController);

      await DbServices().saveUser(Cusers(uid: user!.uid, userName: Name, Email: emailController, Gsm: GsmController, basket: []));
      print("done");
      return true;
    } on FirebaseException catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> resetPassword(String emailController) async {
    try {
      await auth.sendPasswordResetEmail(email: emailController);
      return true;
    } on FirebaseException catch (e) {
      return false;
    }
  }

  User? get user => auth.currentUser; //pour recuperer l'utilisateur courant
}
