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
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          color: COLORS.primaryCol,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(SizeConfig.blockWidth * 70),
            // topRight: Radius.circular(SizeConfig.blockWidth * 20),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: SizeConfig.blockHeight * 3,
              right: SizeConfig.blockWidth * 4,
              child: InkWell(
                onTap: () {},
                // splashColor: Colors.blueGrey[800],
                // splashFactory: InkRipple.splashFactory,
                // radius: SizeConfig.blockWidth * 20,
                child: Container(
                  child: Row(
                    children: [
                      Text(
                        'CONTINUE',
                        style: TextStyle(
                          color: Colors.blueGrey[800],
                          fontWeight: FontWeight.bold,
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

              // IconButton(
              //   icon: const Icon(AntIcons.caretRightOutlined),
              //   onPressed: () {
              //     customLog('Pressed on Ant Cloud icon');
              //   },
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
