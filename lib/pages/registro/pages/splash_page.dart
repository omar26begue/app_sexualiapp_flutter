import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sexual_app/helpers/constants/routers.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      navigationHome();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void navigationHome() async {
    try {
      Navigator.pushReplacementNamed(context, pageEntrace);
    } catch (e) {
      Navigator.pushReplacementNamed(context, pageEntrace);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [HexColor('#DB067E'), HexColor('#8B27B4'), HexColor('#6F33C7'), HexColor('#721696'), HexColor('#740477')],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.clamp,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/img/icon.svg',
              width: 120.0,
              height: 80.0,
            ),
            SizedBox(height: 8.0),
            Text(
              'sexualidapp',
              style: TextStyle(
                fontFamily: 'Quicksand Regular',
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
