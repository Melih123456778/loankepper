import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../utils/image_path.dart';

class InitialImage extends StatelessWidget {
  const InitialImage({super.key});
  final double _imageWidth = 200;
  final double _imageHeight = 300;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _imageWidth,
      height: _imageHeight,
      child: Image.asset(
        ImagePath().initialGoalkeeper,
        fit: BoxFit.cover,
      ).animate().fadeIn(duration: 200.ms).then(delay: 100.ms).slide(),
    );
  }
}
