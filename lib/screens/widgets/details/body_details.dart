import 'package:dro_health/constants.dart';
import 'package:dro_health/model/product.dart';
import 'package:flutter/material.dart';

import 'body_page.dart';

class DetailsPage extends StatelessWidget {
  final Product imageData;

  const DetailsPage({Key key, this.imageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBag, // Body widget product imageData
      body: BodyPage(
        imageData: imageData,
      ),
    );
  }
} /*  */

//
