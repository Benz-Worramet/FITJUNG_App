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
  String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return "Please enter your email address.";
    }

    // Regular expression for basic email validation:
    final emailRegex = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");

    if (!emailRegex.hasMatch(email)) {
      return "Please enter a valid email address (e.g., username@example.com).";
    }

    // More advanced checks as needed (optional):
    // - Check for reserved domain names (e.g., localhost, mail)
    // - Use a third-party email verification service for real-time checks

    return null; // Email is valid
  }

  String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return "Please enter your password";
    }
    // Add password strength or other validation rules as needed
    return null;
  }

  String? confirmPasswordValidator(String? confirmPassword, String? password) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Please confirm your password";
    } else if (confirmPassword != password) {
      return "Passwords do not match";
    }
    return null;
  }
}
