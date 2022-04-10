// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_new,unused_local_variable
import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sih22/components/colors.dart';
import 'package:sih22/components/size_config.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(23.251270, 77.473770),
    zoom: 14.5,
  );
  Location currentLocation = Location();

  /// Set of displayed markers and cluster markers on the map
  final Set<Marker> _markers = {};
  LatLng _center = LatLng(9.669111, 80.014007);
  bool isSearched = false;

  late GoogleMapController _googleMapController;

  // void getLocation() async {
  //   var location = await currentLocation.getLocation();
  //   currentLocation.onLocationChanged.listen((LocationData loc) {
  //     _googleMapController
  //         .animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
  //       target: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
  //       zoom: 12.0,
  //     )));
  //     print(loc.latitude);
  //     print(loc.longitude);
  //     setState(() {
  //       _markers.add(Marker(
  //           markerId: MarkerId('Current'),
  //           position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)));
  //     });
  //   });
  // }

  void _onMapCreated(GoogleMapController controller) {
    _googleMapController = controller;

    // final marker = Marker(
    //   markerId: MarkerId('place_name'),
    //   // position: LatLng(23.207377),
    //   // icon: BitmapDescriptor.,
    //   infoWindow: InfoWindow(
    //     title: 'title',
    //     snippet: 'address',
    //   ),
    // );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      // getLocation();
    });
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: SizeConfig.screenHeight,
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  Container(
                    height: SizeConfig.blockHeight * 92,
                    // Main map
                    child: GoogleMap(
                      // myLocationButtonEnabled: true,
                      myLocationEnabled: true,
                      zoomControlsEnabled: true,
                      initialCameraPosition: _initialCameraPosition,
                      onMapCreated: (controller) =>
                          _googleMapController = controller,
                      markers: _markers,
                    ),
                  ),
                  Container(
                    height: SizeConfig.blockHeight * 8,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      // borderRadius: BorderRadius.only(
                      //   topRight: Radius.circular(10),
                      //   topLeft: Radius.circular(10),
                      // ),
                      // border: Border(
                      //   top: BorderSide(
                      //     color: Colors.red,
                      //     width: 3,
                      //   ),
                      // ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin:
                              EdgeInsets.only(left: SizeConfig.blockWidth * 8),
                          child: Icon(
                            AntIcons.userOutlined,
                            size: SizeConfig.blockWidth * 8,
                            color: COLORS.black,
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(right: SizeConfig.blockWidth * 8),
                          child: Icon(
                            AntIcons.funnelPlotOutlined,
                            size: SizeConfig.blockWidth * 8,
                            color: COLORS.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: SizeConfig.blockWidth * 40,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isSearched = !isSearched;
                    });
                    // getLocation();
                  },
                  child: Container(
                    height: SizeConfig.blockWidth * 20,
                    width: SizeConfig.blockWidth * 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(SizeConfig.blockWidth * 20),
                      ),
                    ),
                    child: Center(
                      child: (isSearched)
                          ? CircularProgressIndicator(
                              color: Colors.grey[800],
                            )
                          : Icon(
                              Icons.search,
                              size: SizeConfig.blockWidth * 8,
                              color: COLORS.black,
                            ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                child: Container(
                  margin: EdgeInsets.only(
                    top: SizeConfig.blockHeight * 5,
                    left: SizeConfig.blockWidth * 5,
                  ),
                  height: SizeConfig.blockHeight * 8,
                  width: SizeConfig.blockWidth * 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: SizeConfig.blockWidth * 76,
                        // height: SizeConfig.blockHeight * 6,
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.black,
                            // fontFamily: 'Rubik',
                            fontSize: SizeConfig.blockWidth * 4.5,
                            fontWeight: FontWeight.w300,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                  // color: COLORS.black,
                                  ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                  // color: COLORS.black,
                                  ),
                            ),
                            hintText: "Enter Location",
                            hintStyle: TextStyle(
                              color: Colors.grey[600],
                              height: 1,
                              fontFamily: 'Rubik',
                              fontSize: SizeConfig.blockWidth * 4.3,
                              fontWeight: FontWeight.w400,
                            ),
                            contentPadding: EdgeInsets.only(
                              left: SizeConfig.blockWidth * 4,
                              top: SizeConfig.blockHeight * 1.5,
                              bottom: SizeConfig.blockHeight * 1.5,
                            ),
                            // prefix: Container(
                            //   height: SizeConfig.blockHeight * 3.2,
                            //   width: SizeConfig.blockWidth * 14,
                            //   child: Icon(
                            //     Icons.search,
                            //     color: Colors.black,
                            //   ),
                            // ),
                          ),
                        ),
                      ),
                      Container(
                        height: SizeConfig.blockHeight * 6,
                        width: SizeConfig.blockHeight * 6,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          // border: Border.all(color: COLORS.black),
                        ),
                        child: Icon(Icons.mic),
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
