import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sexual_app/models/retrofit/responses/perfil_response.dart';

class DatosPersonalesWidget extends StatefulWidget {
  ResponsePerfilModel perfil;

  DatosPersonalesWidget({Key key, @required this.perfil}) : super(key: key);

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
                      'Nombre: ' + widget.perfil.name,
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
                      'Edad: ' + (widget.perfil.age == null ? '-' : widget.perfil.age.toString() + ' años'),
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
                      'Sexo: ' + (widget.perfil.sex == null ? '-' : widget.perfil.sex),
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
                      'Religión: ' + (widget.perfil.name_religion == null ? '-' : widget.perfil.name_religion),
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
                      'Orientación sexual: ' + (widget.perfil.name_sexual_orientation == null ? '-' : widget.perfil.name_sexual_orientation),
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
                      'Email: ' + widget.perfil.email,
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
