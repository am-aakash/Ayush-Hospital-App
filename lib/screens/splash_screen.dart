// ignore_for_file: prefer_const_constructors

import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sih22/components/colors.dart';
import 'package:sih22/components/size_config.dart';
import 'package:sih22/helpers/custom_log.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: Colors.lime[200], //COLORS.primaryCol,
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: SizeConfig.blockHeight * 3,
            right: SizeConfig.blockWidth * 4,
            child: InkWell(
              onTap: () {},
              // splashColor: Colors.blueGrey[800],
              // splashFactory: InkRipple.splashFactory,
              // radius: SizeConfig.blockWidth * 20,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/home_screen');
                },
                child: Row(
                  children: [
                    Text(
                      'CONTINUE',
                      style: TextStyle(
                        color: Colors.blueGrey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.blockWidth * 3,
                        // height: SizeConfig.blockHeight * 0,
                      ),
                    ),
                    Icon(
                      AntIcons.caretRightOutlined,
                      color: Colors.blueGrey[800],
                      size: SizeConfig.blockWidth * 4.5,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: SizeConfig.screenHeight,
            // width: SizeConfig.screenWidth,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: COLORS.primaryCol,
              border: Border.fromBorderSide(BorderSide.none),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(SizeConfig.blockWidth * 70),
                // topRight: Radius.circular(SizeConfig.blockWidth * 20),
              ),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: -220,
                  child: Container(
                    decoration: BoxDecoration(
                      // color: COLORS.primaryCol,
                      borderRadius: BorderRadius.only(
                        bottomRight:
                            Radius.circular(SizeConfig.blockWidth * 70),
                        // topRight: Radius.circular(SizeConfig.blockWidth * 20),
                      ),
                    ),
                    child: Image.asset(
                      'assets/images/bgbuilding.png',
                      scale: 4,
                      color: COLORS.primaryCol,
                      colorBlendMode: BlendMode.color,
                    ),
                  ),
                ),
                Container(
                  height: SizeConfig.blockHeight * 30,
                  margin: EdgeInsets.only(top: SizeConfig.blockHeight * 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/building.png'),
                    ),
                  ),
                ),
                Container(
                  height: SizeConfig.blockHeight * 20,
                  margin: EdgeInsets.only(top: SizeConfig.blockHeight * 22.2),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/location.png'),
                    ),
                  ),
                ),
                Container(
                  height: SizeConfig.blockHeight * 30,
                  margin: EdgeInsets.only(top: SizeConfig.blockHeight * 34),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/text.png'),
                    ),
                  ),
                ),
                Container(
                  height: SizeConfig.blockHeight * 12,
                  margin: EdgeInsets.only(top: SizeConfig.blockHeight * 72),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/ndhm.png'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
