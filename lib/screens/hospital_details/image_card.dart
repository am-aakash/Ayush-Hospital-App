// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:clippy_flutter/triangle.dart';
import 'package:flutter/material.dart';
import 'package:sih22/components/size_config.dart';

Widget imageCard({@required String? uri}) {
  return Container(
    height: SizeConfig.blockHeight * 22,
    width: SizeConfig.blockWidth * 70,
    margin: EdgeInsets.only(
        right: SizeConfig.blockWidth * 2, left: SizeConfig.blockWidth * 3),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      // border: Border.all(color: COLORS.black),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 3.0,
        ),
      ],
      image: DecorationImage(
        image: NetworkImage("$uri"),
        fit: BoxFit.cover,
      ),
    ),
  );
}
