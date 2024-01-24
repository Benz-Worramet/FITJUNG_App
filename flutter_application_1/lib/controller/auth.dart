import 'package:firebase_auth/firebase_auth.dart';

class Authen {
  final User? user = FirebaseAuth.instance.currentUser;
  bool checklogin() {
    if (user == null) {
      return false;
    } else {
      return true;
    }
  }
}
