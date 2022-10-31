import 'package:flutter/material.dart';
import 'package:flutter_catalog/constants.dart';
import 'package:flutter_catalog/default_button.dart';
import 'package:flutter_catalog/size_config.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../components/splash_content.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  final pages = [
    Container(
      color: Color.fromARGB(255, 181, 101, 29),
    ),
    Container(
      color: Color.fromARGB(255, 196, 164, 132),
    ),
  ];
  List<Map<String, String>> splashData = [
    {
      "text": "Find the Best Product you like.",
      "image": "assets/images/splash_1.png"
    },
    {
      
      "text":"Products are delivered home safely and securely.",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "Easy and Secure Payment Method.",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        context.vxNav.push(Uri(path: MyRoutes.loginRoute));
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
