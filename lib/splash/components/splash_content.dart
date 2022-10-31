import 'package:flutter/material.dart';
import 'package:flutter_catalog/size_config.dart';


class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "Rural4Us!",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: Color.fromARGB(255, 150, 75, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(flex: 2),
        Image.asset(
          image!,
          height: 370,
          width: 455,
        ),
            Text(
          text!,
          
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromARGB(255, 150, 75, 20),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          "Find your favourite & famous\n rural products that you are fond of",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
