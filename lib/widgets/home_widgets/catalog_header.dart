import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Rural4Us".text.xl5.bold.color(Colors.brown).make(),
        "Classic products".text.xl2.make(),
      ],
    );
  }
}