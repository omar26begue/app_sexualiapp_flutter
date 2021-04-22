import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class ShowLoadingSexualidad extends StatefulWidget {
  bool loading;

  ShowLoadingSexualidad({this.loading});

  @override
  _ShowLoadingSexualidadState createState() {
    return _ShowLoadingSexualidadState();
  }
}

class _ShowLoadingSexualidadState extends State<ShowLoadingSexualidad> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return widget.loading == true
        ? Container(
          width: size.width,
          height: size.height,
          //decoration: BoxDecoration(color: Colors.black54),
          child: LottieBuilder.asset(
            "assets/22420-loader-fetch-details.json",
            fit: BoxFit.contain,
            width: size.width * 0.2,
            height: size.height * 0.2,
          ),
        )
        : SizedBox();
  }
}
