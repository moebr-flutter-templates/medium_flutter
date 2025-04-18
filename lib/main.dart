import 'package:flutter/material.dart';
import 'package:medium_flutter/screens/MSplashScreen.dart';
import 'package:nb_utils/nb_utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medium App',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: MSplashScreen(),
    );
  }
}
