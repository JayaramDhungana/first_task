import 'package:flutter/material.dart';

Container hotelsScreenWidget(
  {
    required String imageUrl,
  }
) {
  return Container(
    height: 500,
    width: 700,
    child: Image(image: AssetImage(imageUrl)),
  );
}
