import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:loan_keeper/screens/select_age_screen.dart';
import 'package:loan_keeper/utils/project_strings.dart';
import 'package:loan_keeper/widgets/initial_image_texts.dart';
import 'package:loan_keeper/widgets/custom_lime_button.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            const InitialImage(),
            ProjectText().welcomeText.animate().fadeIn(duration: 400.ms).then(delay: 150.ms).slide(),
            Padding(
                padding: const EdgeInsets.only(right: 12.0, left: 12.0, top: 16),
                child: ProjectText().initialDesc.animate().fadeIn(duration: 600.ms).then(delay: 200.ms).slide()),
            const Spacer(),
            CustomLimeButton(
              title: ProjectText().next,
              route: const SelectAgeScreen(),
            ),
            const Spacer(),
            initialEndRow()
          ],
        ),
      ),
    );
  }

  Row initialEndRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(onPressed: () {}, child: ProjectText().alreadyRegistered),
        TextButton(onPressed: () {}, child: ProjectText().login)
      ],
    );
  }
}
