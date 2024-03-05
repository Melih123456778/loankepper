import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loan_keeper/auth/login_or_register_screen.dart';
import 'package:loan_keeper/screens/home_screen.dart';
import 'package:loan_keeper/screens/login_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //kullanıcı giriş yaptığında
          if (snapshot.hasData) {
            return const HomeScreen();
          }
          //kullanıcı giriş yapmadığında
          else {
            return const LoginOrRegisterScreen();
          }
        },
      ),
    );
  }
}
