import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Rural4Us".text.xl5.bold.color(Color.fromARGB(255, 150, 75, 20)).make(),
        "Classic products".text.xl2.make(),
      ],
    );
  }
}