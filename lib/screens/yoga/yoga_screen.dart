// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sih22/components/size_config.dart';
import 'package:sih22/screens/yoga/yoga_asanas_screen.dart';
import 'package:sih22/screens/yoga/yoga_category_screen.dart';
import 'package:lottie/lottie.dart';

class YogaScreen extends StatelessWidget {
  const YogaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              left: SizeConfig.blockWidth * 5,
              right: SizeConfig.blockWidth * 5,
              top: SizeConfig.blockHeight * 22,
              bottom: SizeConfig.blockHeight * 2,
            ),
            child: Lottie.asset(
              "assets/lottie/yoga_home.json",
              width: SizeConfig.blockWidth * 90,
              animate: true,
              reverse: true,
              frameRate: FrameRate(500),
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(height: SizeConfig.blockHeight * 70),
              Container(
                height: SizeConfig.blockHeight * 8,
                width: SizeConfig.blockWidth * 90,
                margin: EdgeInsets.only(
                  left: SizeConfig.blockWidth * 5,
                  right: SizeConfig.blockWidth * 5,
                  top: SizeConfig.blockHeight * 0,
                  bottom: SizeConfig.blockHeight * 2,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => YogaCategory()),
                    );
                  },
                  child: Center(
                    child: Text(
                      "Yoga By Categories",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.blockWidth * 5,
                        color: Colors.amber[600],
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: SizeConfig.blockHeight * 8,
                width: SizeConfig.blockWidth * 90,
                margin: EdgeInsets.only(
                  left: SizeConfig.blockWidth * 5,
                  right: SizeConfig.blockWidth * 5,
                  top: SizeConfig.blockHeight * 0,
                  bottom: SizeConfig.blockHeight * 2,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => YogaAsanas()),
                    );
                  },
                  child: Center(
                    child: Text(
                      "Yoga Asanas",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.blockWidth * 5,
                        color: Colors.amber[600],
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
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
