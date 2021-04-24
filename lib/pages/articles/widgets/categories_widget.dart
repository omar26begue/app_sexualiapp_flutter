import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

// ignore: must_be_immutable
class CategoriesWidget extends StatefulWidget {
  String texto, icon, categories, active;

  CategoriesWidget({Key key, @required this.texto, @required this.icon, @required this.categories, @required this.active}) : super(key: key);

  @override
  _CategoriesWidgetState createState() {
    return _CategoriesWidgetState();
  }
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 81.0,
      height: 71.0,
      decoration: BoxDecoration(
        color: widget.categories == widget.active ? HexColor('#A5047D') :HexColor('#6F33C7'),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(widget.icon),
          Text(
            widget.texto,
            style: TextStyle(
              fontFamily: 'Quicksand Regular',
              fontSize: 13.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
