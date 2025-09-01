
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OnBoardingImage extends StatelessWidget {
   OnBoardingImage({super.key,required this.image});
  String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 343, height: 290, child: Image(image: AssetImage(image)));
  }
}
