import 'package:authencicationtest/widgets/homepage/home.dart';

import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash2(),
      debugShowCheckedModeBanner: false,
    );
  }
}

//creates a screen when the app starts
class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      backgroundColor: Colors.black,
      navigateAfterSeconds: MyhomePage(),
      title: new Text(
        'Pocket Docker',
        textScaleFactor: 2,
      ),
      image: new Image.asset(
        'images/download.png',
      ),
      loadingText: Text(
        "Taking you in",
        style: TextStyle(
          color: Colors.amber,
        ),
      ),
      photoSize: 100.0,
      loaderColor: Colors.amber[900],
    );
  }
}
