import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginWidget extends StatefulWidget {
  LoginWidget({Key key}) : super(key: key);

  @override
  _LoginWidgetState createState() {
    return _LoginWidgetState();
  }
}

class _LoginWidgetState extends State<LoginWidget> {
  bool loading = false;
  TextEditingController _emailLogin = new TextEditingController();
  TextEditingController _passwordLogin = new TextEditingController();

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
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          SizedBox(height: 53.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
              child: TextFormField(
                enabled: !loading,
                controller: _emailLogin,
                onFieldSubmitted: (v) {
                  //FocusScope.of(context).requestFocus(_focusContrasena);
                },
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.start,
                cursorColor: HexColor('#665EFF'),
                style: TextStyle(
                    //color: HexColor(color161F3D),
                    ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: HexColor('#78849E'),
                    fontFamily: 'Gibson SemiBlod',
                    fontSize: 15.0,
                  ),
                  errorStyle: TextStyle(
                    fontFamily: 'Open Sans Regular',
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
              child: TextFormField(
                enabled: !loading,
                controller: _passwordLogin,
                onFieldSubmitted: (v) {
                  //FocusScope.of(context).requestFocus(_focusContrasena);
                },
                keyboardType: TextInputType.text,
                textAlign: TextAlign.start,
                cursorColor: HexColor('#665EFF'),
                style: TextStyle(
                    //color: HexColor(color161F3D),
                    ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Contraseña',
                  hintStyle: TextStyle(
                    color: HexColor('#78849E'),
                    fontFamily: 'Gibson SemiBlod',
                    fontSize: 15.0,
                  ),
                  errorStyle: TextStyle(
                    fontFamily: 'Open Sans Regular',
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Olvide mi contraseña',
                style: TextStyle(
                  fontFamily: 'Gibson SemiBlod',
                  fontSize: 12.0,
                  color: HexColor('#78849E'),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.0),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: HexColor('#6F33C7'),
              borderRadius: BorderRadius.all(Radius.circular(35.0)),
            ),
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              'Iniciar sessión',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Gibson SemiBlod',
                fontSize: 15.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
