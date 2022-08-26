// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_new,unused_local_variable
import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sih22/components/colors.dart';
import 'package:sih22/components/size_config.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:clippy_flutter/triangle.dart';
import 'package:sih22/models/hospital_data.dart';
import 'package:sih22/screens/drawer.dart';
import 'package:sih22/screens/hospital_details/hospital_details_page.dart';
import 'package:sih22/screens/map_helpers/info_window.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(10.052692913493223, 76.4540444001787),
    zoom: 14.5,
  );
  Location currentLocation = Location();
  late BitmapDescriptor myIcon;
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  /// Set of displayed markers and cluster markers on the map
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  bool isSearched = false;

  late GoogleMapController _googleMapController;

  void _currentLocation() async {
    var location = await currentLocation.getLocation();

    _googleMapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(location.latitude!, location.longitude!),
        zoom: 17.0,
      ),
    ));
  }

  void initState() {
    // _currentLocation();
    super.initState();
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      'assets/images/pin.png',
    ).then((onValue) {
      myIcon = onValue;
    });
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    _googleMapController.dispose();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    _googleMapController = controller;
    _customInfoWindowController.googleMapController = controller;

    setState(() {
      // _currentLocation();
      for (final el in hospitals) {
        markers[MarkerId("${el.id}")] = Marker(
          markerId: MarkerId("${el.id}"),
          position: el.latLng!,
          icon: myIcon,
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              infoWindowHelper(
                hospital: el,
                context: context,
              ),
              el.latLng!,
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isHindi = false;
    return Scaffold(
      key: _scaffoldKey,
      drawer: drawerHelper(context),
      body: SingleChildScrollView(
        child: Container(
          height: SizeConfig.screenHeight,
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  Container(
                    height: SizeConfig.blockHeight * 100,
                    // Main map
                    child: GoogleMap(
                      myLocationButtonEnabled: false,
                      myLocationEnabled: true,
                      zoomControlsEnabled: true,
                      initialCameraPosition: _initialCameraPosition,
                      onMapCreated: _onMapCreated,
                      onTap: (position) {
                        _customInfoWindowController.hideInfoWindow!();
                      },
                      onCameraMove: (position) {
                        _customInfoWindowController.onCameraMove!();
                      },
                      markers: Set<Marker>.of(markers.values),
                    ),
                  ),
                  // Container(
                  //   height: SizeConfig.blockHeight * 7,
                  //   decoration: const BoxDecoration(
                  //     color: Colors.white,
                  //     // borderRadius: BorderRadius.all(Radius.circular(8)),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.black12,
                  //         blurRadius: 2.0,
                  //       ),
                  //     ],
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: <Widget>[
                  //       Container(
                  //         margin:
                  //             EdgeInsets.only(left: SizeConfig.blockWidth * 10),
                  //         child: Icon(
                  //           AntIcons.userOutlined,
                  //           size: SizeConfig.blockWidth * 7,
                  //           color: COLORS.black,
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(
                  //             right: SizeConfig.blockWidth * 10),
                  //         child: Icon(
                  //           AntIcons.funnelPlotOutlined,
                  //           size: SizeConfig.blockWidth * 7,
                  //           color: COLORS.black,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
              Positioned(
                bottom: 40,
                left: SizeConfig.blockWidth * 30,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/hospital_list');
                  },
                  child: Container(
                    height: SizeConfig.blockHeight * 6,
                    width: SizeConfig.blockWidth * 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      // border: Border.all(color: COLORS.black),
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.black12,
                          blurRadius: 3.0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'View List',
                        style: TextStyle(
                          fontSize: SizeConfig.blockWidth * 3.6,
                          fontFamily: 'Poppins',
                          color: COLORS.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              CustomInfoWindow(
                controller: _customInfoWindowController,
                height: SizeConfig.blockHeight * 24,
                width: SizeConfig.blockWidth * 60,
                offset: 0,
              ),
              // cneter icon
              // Positioned(
              //   bottom: 15,
              //   left: SizeConfig.blockWidth * 42.5,
              //   child: InkWell(
              //     onTap: () {
              //       _currentLocation();
              //     },
              //     child: Container(
              //       height: SizeConfig.blockWidth * 15,
              //       width: SizeConfig.blockWidth * 15,
              //       decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.all(
              //           Radius.circular(SizeConfig.blockWidth * 20),
              //         ),
              //       ),
              //       child: Center(
              //         child: Icon(
              //           Icons.location_on,
              //           size: SizeConfig.blockWidth * 7,
              //           color: COLORS.black,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              Positioned(
                top: SizeConfig.blockHeight * 7,
                child: Container(
                  width: SizeConfig.blockWidth * 90,
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockWidth * 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        child: Container(
                          height: SizeConfig.blockHeight * 5.2,
                          width: SizeConfig.blockHeight * 5.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            // border: Border.all(color: COLORS.black),
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.black12,
                                blurRadius: 3.0,
                              ),
                            ],
                          ),
                          child: Icon(AntIcons.menuOutlined),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.pushNamed(context, '/notification_page');
                          _currentLocation();
                        },
                        child: Container(
                          height: SizeConfig.blockHeight * 5.2,
                          width: SizeConfig.blockHeight * 5.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            // border: Border.all(color: COLORS.black),
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.black12,
                                blurRadius: 3.0,
                              ),
                            ],
                          ),
                          child: Icon(Icons.location_on),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
