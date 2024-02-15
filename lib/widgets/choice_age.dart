import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class ChoiceAgeWidget extends StatefulWidget {
  const ChoiceAgeWidget({super.key});

  @override
  State<ChoiceAgeWidget> createState() => _ChoiceAgeWidgetState();
}

class _ChoiceAgeWidgetState extends State<ChoiceAgeWidget> {
  int _currentValue = 15;
  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      value: _currentValue,
      minValue: 15,
      maxValue: 50,
      textStyle: const TextStyle(fontSize: 28, fontWeight: FontWeight.normal),
      itemWidth: 100,
      haptics: true,
      itemHeight: 100,
      selectedTextStyle: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      zeroPad: false,
      axis: Axis.horizontal,
      onChanged: (value) => setState(() => _currentValue = value),
    );
  }
}
