// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:sih22/screens/yoga/asanas_box.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter/material.dart';
import 'package:sih22/components/size_config.dart';

class YogaAsanas extends StatefulWidget {
  const YogaAsanas({Key? key}) : super(key: key);

  @override
  State<YogaAsanas> createState() => _YogaAsanasState();
}

class _YogaAsanasState extends State<YogaAsanas> {
  late YoutubePlayerController _ytbPlayerController1;
  late YoutubePlayerController _ytbPlayerController2;
  late YoutubePlayerController _ytbPlayerController3;
  late YoutubePlayerController _ytbPlayerController4;

  @override
  void initState() {
    super.initState();
    List<String> videosList = [
      'i1xBhOYSMrA',
      'Pg4a6G2Lzas',
      'N6vhUXsCC3U',
      'YMd7cdykJNc',
    ];

    _setOrientation([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        _ytbPlayerController1 = YoutubePlayerController(
          initialVideoId: videosList[0],
          params: YoutubePlayerParams(
            showFullscreenButton: true,
            loop: true,
          ),
        );
        _ytbPlayerController2 = YoutubePlayerController(
          initialVideoId: videosList[1],
          params: YoutubePlayerParams(
            showFullscreenButton: true,
            loop: true,
          ),
        );
        _ytbPlayerController3 = YoutubePlayerController(
          initialVideoId: videosList[2],
          params: YoutubePlayerParams(
            showFullscreenButton: true,
            loop: true,
          ),
        );
        _ytbPlayerController4 = YoutubePlayerController(
          initialVideoId: videosList[3],
          params: YoutubePlayerParams(
            showFullscreenButton: true,
            loop: true,
          ),
        );
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    _setOrientation([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _ytbPlayerController1.close();
    _ytbPlayerController2.close();
    _ytbPlayerController3.close();
    _ytbPlayerController4.close();
  }

  _setOrientation(List<DeviceOrientation> orientations) {
    SystemChrome.setPreferredOrientations(orientations);
  }

  _buildYtbView1() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      // ignore: unnecessary_null_comparison
      child: _ytbPlayerController1 != null
          ? YoutubePlayerIFrame(controller: _ytbPlayerController1)
          : Center(child: CircularProgressIndicator()),
    );
  }

  _buildYtbView2() {
    return Container(
      // width: SizeConfig.blockWidth * 60,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        // ignore: unnecessary_null_comparison
        child: _ytbPlayerController1 != null
            ? YoutubePlayerIFrame(controller: _ytbPlayerController2)
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }

  _buildYtbView3() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      // ignore: unnecessary_null_comparison
      child: _ytbPlayerController1 != null
          ? YoutubePlayerIFrame(controller: _ytbPlayerController3)
          : Center(child: CircularProgressIndicator()),
    );
  }

  _buildYtbView4() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      // ignore: unnecessary_null_comparison
      child: _ytbPlayerController1 != null
          ? YoutubePlayerIFrame(controller: _ytbPlayerController4)
          : Center(child: CircularProgressIndicator()),
    );
  }

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
                  "Yoga Asanas",
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
                  top: SizeConfig.blockHeight * 1,
                  bottom: SizeConfig.blockHeight * 1,
                ),
                child: Lottie.asset(
                  "assets/lottie/yoga_draw.json",
                  width: SizeConfig.blockWidth * 70,
                  animate: true,
                  reverse: true,
                  frameRate: FrameRate(500),
                ),
              ),
              asanaBox(
                name: "TĀDĀSANA",
                yt: _buildYtbView1(),
                desc:
                    "This āsana brings stability in the body,\nhelps to clear up congestion of the spinal nerves and corrects faulty posture.\nIt has a cooling effect on the body and mind.\nIt is beneficial for persons suffering from high blood pressure.\nIt satisfies thirst and appeases hunger.\nIt relieves indigestion and disorders caused by phlegm (cough) and bile (pitta)\nIt has a cooling effect on the body and mind.\nIt is beneficial for persons suffering from high blood pressure.\nIt satisfies thirst and appeases hunger.\nIt relieves indigestion and disorders caused by phlegm (cough) and bile (pitta)",
              ),
              asanaBox(
                name: "ŚĪTALĪ PRĀṆĀYĀMA",
                yt: _buildYtbView2(),
                desc:
                    "It has a cooling effect on the body and mind.\nIt is beneficial for persons suffering from high blood pressure.\nIt satisfies thirst and appeases hunger.\nIt relieves indigestion and disorders caused by phlegm (cough) and bile (pitta)\nIt has a cooling effect on the body and mind.\nIt is beneficial for persons suffering from high blood pressure.\nIt satisfies thirst and appeases hunger.\nIt relieves indigestion and disorders caused by phlegm (cough) and bile (pitta)\nIt has a cooling effect on the body and mind.\nIt is beneficial for persons suffering from high blood pressure.\nIt satisfies thirst and appeases hunger.\nIt relieves indigestion and disorders caused by phlegm (cough) and bile (pitta)",
              ),
              asanaBox(
                name: "BHRĀMARĪ PRĀṆĀYĀMA",
                yt: _buildYtbView3(),
                desc:
                    "This āsana brings stability in the body, helps to clear up congestion of the spinal nerves and corrects faulty posture.\nIt has a cooling effect on the body and mind.\nIt is beneficial for persons suffering from high blood pressure.\nIt satisfies thirst and appeases hunger.\nIt relieves indigestion and disorders caused by phlegm (cough) and bile (pitta)\nIt has a cooling effect on the body and mind.\nIt is beneficial for persons suffering from high blood pressure.\nIt satisfies thirst and appeases hunger.\nIt relieves indigestion and disorders caused by phlegm (cough) and bile (pitta)",
              ),
              asanaBox(
                name: "ARDHA UṢṬRĀSANA",
                yt: _buildYtbView4(),
                desc:
                    "This āsana brings stability in the body, helps to clear up congestion of the spinal nerves and corrects faulty posture.\nIt has a cooling effect on the body and mind.\nIt is beneficial for persons suffering from high blood pressure.\nIt satisfies thirst and appeases hunger.\nIt relieves indigestion and disorders caused by phlegm (cough) and bile (pitta)\nIt has a cooling effect on the body and mind.\nIt is beneficial for persons suffering from high blood pressure.\nIt satisfies thirst and appeases hunger.\nIt relieves indigestion and disorders caused by phlegm (cough) and bile (pitta)",
              ),
              // _buildYtbView1(),
              // _buildYtbView2(),
              // _buildYtbView3(),
              // _buildYtbView4(),
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
