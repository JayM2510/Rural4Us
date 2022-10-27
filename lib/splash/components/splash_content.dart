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
            color: Colors.brown,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text!,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Image.asset(
          image!,
          height: 370,
          width: 455,
        ),
      ],
    );
  }
}
