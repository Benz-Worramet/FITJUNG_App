import 'package:firebase_auth/firebase_auth.dart';

class Authen {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = FirebaseAuth.instance.currentUser;
  bool checklogin() {
    if (user == null) {
      return false;
    } else {
      return true;
    }
  }
  Future<void> loginEmail(String Email, String Password)async{
    await auth.signInWithEmailAndPassword(email: Email, password: Password);

  }
}
