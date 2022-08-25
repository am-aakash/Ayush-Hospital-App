// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sih22/screens/home_page.dart';
import 'package:sih22/screens/hospital_list_page.dart';
import 'package:sih22/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ayush Hospitals near me',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Splash(),
        '/home_screen': (context) => const HomePage(),
        '/hospital_list': (context) => const HospitalListPage(),
        '/notification_page': (context) => const NotificationPage(),
      },
    );
  }
}
