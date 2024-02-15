import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({super.key});

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  final TextEditingController t1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextField(
            autocorrect: true,
            controller: t1,
            decoration: InputDecoration(
              hintText: "Email",
              prefixIcon: Image.asset('assets/soccer_ball.png'),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextField(
            autocorrect: true,
            controller: t1,
            decoration: InputDecoration(
              hintText: "Şifre",
              prefixIcon: Image.asset('assets/goalkeeper.png'),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
