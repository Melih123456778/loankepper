import 'package:flutter/material.dart';
import 'package:loan_keeper/auth/auth_page.dart';
import 'package:loan_keeper/utils/project_strings.dart';
import 'package:loan_keeper/widgets/choice_age.dart';
import 'package:loan_keeper/widgets/custom_lime_button.dart';

import '../utils/image_path.dart';

class SelectAgeScreen extends StatelessWidget {
  const SelectAgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Yaşınızı Seçin'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: 300,
              height: 400,
              child: Image.asset(
                ImagePath().footballAge,
                fit: BoxFit.fitWidth,
              )),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChoiceAgeWidget(),
            ],
          ),
          CustomLimeButton(
            title: ProjectText().confirm,
            route: const AuthPage(),
          )
        ],
      ),
    );
  }
}
