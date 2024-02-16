import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loan_keeper/screens/home_screen.dart';
import 'package:loan_keeper/screens/profile_screen.dart';
import 'package:loan_keeper/screens/register_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const ProfileScreen();
          } else {
            return const RegisterScreen();
          }
        },
      ),
    );
  }
}
