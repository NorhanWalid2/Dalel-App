import 'package:flutter/material.dart';

class CustomHeaderWidget extends StatelessWidget {
  const CustomHeaderWidget({
    super.key,
    required this.text,
    required this.textStyle,
  });
  final String text;
  final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    return Align(child: Text(text, style: textStyle));
  }
}
