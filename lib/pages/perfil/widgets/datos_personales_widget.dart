import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class DatosPersonalesWidget extends StatefulWidget {
  DatosPersonalesWidget({Key key}) : super(key: key);

  @override
  _DatosPersonalesWidgetState createState() {
    return _DatosPersonalesWidgetState();
  }
}

class _DatosPersonalesWidgetState extends State<DatosPersonalesWidget> {
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 42.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Datos personales',
                style: TextStyle(
                  fontFamily: 'Quicksand Blod',
                  fontSize: 18.0,
                  color: HexColor('#454F63'),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Nombre: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Gibson Regular',
                        fontSize: 14.0,
                        color: HexColor('#78849E'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.0),
                Row(
                  children: [
                    Text(
                      'Edad: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Gibson Regular',
                        fontSize: 14.0,
                        color: HexColor('#78849E'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.0),
                Row(
                  children: [
                    Text(
                      'Sexo: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Gibson Regular',
                        fontSize: 14.0,
                        color: HexColor('#78849E'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.0),
                Row(
                  children: [
                    Text(
                      'Religión: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Gibson Regular',
                        fontSize: 14.0,
                        color: HexColor('#78849E'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.0),
                Row(
                  children: [
                    Text(
                      'Orientación sexual: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Gibson Regular',
                        fontSize: 14.0,
                        color: HexColor('#78849E'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.0),
                Row(
                  children: [
                    Text(
                      'Email: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Gibson Regular',
                        fontSize: 14.0,
                        color: HexColor('#78849E'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
