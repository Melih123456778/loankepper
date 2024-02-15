import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:loan_keeper/widgets/login_textfield.dart';
import '../utils/image_path.dart';
import '../utils/project_strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView(
        children: [
          Column(
            children: [
              imageBox().animate().shimmer(duration: const Duration(seconds: 2)),
              loanKeeperRow(),
              const LoginTextField(),
              forgotPswd(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18.0,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {}, child: ProjectText().signIn),
                ),
              ),
              orRow(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: () {}, icon: Image.asset(ImagePath().google)),
                ],
              )
            ],
          ),
        ],
      )),
    );
  }

  Row orRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              color: Colors.lime,
              height: 2,
            ),
          ),
        ),
        ProjectText().or,
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              color: Colors.lime,
              height: 2,
            ),
          ),
        ),
      ],
    );
  }

  Padding forgotPswd() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [ProjectText().forgotPswd],
      ),
    );
  }

  Row loanKeeperRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProjectText().loanKeeper,
      ],
    );
  }

  SizedBox imageBox() {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Image.asset(
        ImagePath().loginPhoto,
        fit: BoxFit.contain,
      ),
    );
  }
}
