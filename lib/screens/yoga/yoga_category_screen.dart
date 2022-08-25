// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sih22/components/size_config.dart';
import 'package:sih22/screens/yoga/yoga_category_box.dart';

class YogaCategory extends StatelessWidget {
  const YogaCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              SizedBox(height: SizeConfig.blockHeight * 3.4),
              Center(
                child: Text(
                  "Yoga Categories",
                  maxLines: 4,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: SizeConfig.blockWidth * 5,
                    color: Colors.amber[600],
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: SizeConfig.blockWidth * 5,
                  right: SizeConfig.blockWidth * 5,
                  top: 20,
                ),
                height: SizeConfig.blockHeight * 0.1,
                width: SizeConfig.blockWidth * 80,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  // borderRadius: BorderRadius.all(Radius.circular(8)),
                  // border: Border.all(color: COLORS.black),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black12,
                  //     blurRadius: 3.0,
                  //   ),
                  // ],
                ),
              ),
              yogaCategoryBox(
                category: "Back pain",
                asanas: [
                  "ARDHA USTRĀSANA",
                  "USTRĀSANA",
                  "ŚAŚAKĀSANA",
                  "UTTĀNA MANDŪKĀSANA",
                  "BHUJANGĀSANA",
                ],
                desc: [
                  "(The	Half	Camel  Posture)",
                  "(Camel Posture)",
                  "(The	Hare	Posture)",
                  "(Stretched up-frog posture)",
                  "(The	Cobra	Posture)",
                ],
              ),
              yogaCategoryBox(
                category: "gjdjjhfdghs",
                asanas: [
                  "ARDHA USTRĀSANA",
                  "USTRĀSANA",
                  "ŚAŚAKĀSANA",
                ],
                desc: [
                  "(The	Half	Camel  Posture)",
                  "(Camel Posture)",
                  "(The	Hare	Posture)",
                ],
              ),
              yogaCategoryBox(
                category: "abcd pain",
                asanas: [
                  "ARDHA USTRĀSANA",
                  "USTRĀSANA",
                  "ŚAŚAKĀSANA",
                  "UTTĀNA MANDŪKĀSANA",
                  "BHUJANGĀSANA",
                ],
                desc: [
                  "(The	Half	Camel  Posture)",
                  "(Camel Posture)",
                  "(The	Hare	Posture)",
                  "(Stretched up-frog posture)",
                  "(The	Cobra	Posture)",
                ],
              ),
            ],
          ),
          Positioned(
            top: SizeConfig.blockHeight * 7,
            left: SizeConfig.blockWidth * 5,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: SizeConfig.blockHeight * 5.2,
                width: SizeConfig.blockHeight * 5.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  // border: Border.all(color: COLORS.black),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: Icon(Icons.arrow_back),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
