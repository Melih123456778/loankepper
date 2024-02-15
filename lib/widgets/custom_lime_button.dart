import 'package:flutter/material.dart';

class CustomLimeButton extends StatelessWidget {
  const CustomLimeButton({super.key, required this.title, this.route});

  final Widget title;
  final Widget? route;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18.0,
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: () {
              if (route != null) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => route!,
                    ));
              }
            },
            child: title),
      ),
    );
  }
}
