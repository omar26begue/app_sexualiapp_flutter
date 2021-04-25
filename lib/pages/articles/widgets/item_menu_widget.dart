import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

// ignore: must_be_immutable
class ItemMenuWidget extends StatefulWidget {
  String icon, name;

  ItemMenuWidget({Key key, @required this.name, @required this.icon}) : super(key: key);

  @override
  _ItemMenuWidgetState createState() {
    return _ItemMenuWidgetState();
  }
}

class _ItemMenuWidgetState extends State<ItemMenuWidget> {
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
    return Row(
      children: [
        SvgPicture.asset(widget.icon, width: 20.0, height: 20.0),
        SizedBox(width: 16.0),
        Flexible(
          child: Text(
            widget.name,
            style: TextStyle(
              fontFamily: 'Gibson Regular',
              fontSize: 18.0,
              color: HexColor('#454F63'),
            ),
          ),
        ),
      ],
    );
  }
}