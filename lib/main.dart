import 'package:flutter/material.dart';
import 'package:sih22/screens/home_page.dart';
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
        '/': (context) => const SplashScreen(),
        '/home_screen': (context) => const HomePage(),
        '/notification_page': (context) => const NotificationPage(),
      },
    );
  }
}
