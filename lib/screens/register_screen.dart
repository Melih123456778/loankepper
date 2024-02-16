import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:loan_keeper/widgets/login_textfield.dart';
import '../utils/image_path.dart';
import '../utils/project_strings.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
              Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                  right: 18.0,
                  top: 10,
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
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ProjectText().loanKeeper,
        ),
      ],
    );
  }

  SizedBox imageBox() {
    return SizedBox(
      width: double.infinity,
      height: 280,
      child: Image.asset(
        ImagePath().loginPhoto,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
