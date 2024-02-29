import 'package:flutter/material.dart';
import 'package:loan_keeper/auth/auth_page.dart';
import 'package:loan_keeper/screens/home_screen.dart';
import 'package:loan_keeper/screens/login_screen.dart';
import 'package:loan_keeper/screens/profile_screen.dart';
import 'package:loan_keeper/screens/register_screen.dart';

import 'screens/create_match_screen.dart';
import 'screens/initial_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 245, 238, 238),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 245, 238, 238),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.lime),
        )),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
