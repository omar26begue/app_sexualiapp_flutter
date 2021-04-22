import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:sexual_app/helpers/dialog.dart';
import 'package:sexual_app/helpers/email.dart';
import 'package:sexual_app/helpers/response.dart';
import 'package:sexual_app/models/retrofit/requests/login_request.dart';
import 'package:sexual_app/services/api_services.dart';

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
  var logger = new Logger();

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
                obscureText: true,
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
          InkWell(
            onTap: () => actionLogin(),
            child: loading == false
                ? Container(
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
                  )
                : Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }

  Future<void> actionLogin() async {
    try {
      FocusScope.of(context).requestFocus(new FocusNode());

      String texto = '';
      if (_emailLogin.text.isEmpty)
        texto = 'Correo electrónico es un campo requerido';
      else if (_emailLogin.text.isNotEmpty) {
        if (ValidateSexualidad.validateEmail(_emailLogin.text) == false) texto = 'Dirección de correo electrónico incorrecta';
      } else if (_passwordLogin.text.isEmpty)
        texto = 'Contraseña es un campo requerido';
      else if (_passwordLogin.text.isNotEmpty) {
        if (_passwordLogin.text.length > 5) texto = 'Contraseña demasiado corta';
      }

      if (texto.length == 0) {
        setState(() => loading = true);
        RequestLoginModel login = new RequestLoginModel(email: _emailLogin.text, password: _passwordLogin.text);
        final response = await Provider.of<APISexualidadServices>(context, listen: false).loginUsers(login);
        setState(() => loading = false);

        Response.responseMedical(
          context: context,
          statusCode: response.statusCode,
          logger: logger,
          functionCode: () {},
          error: response.error,
          executeError: () {},
        );
      } else {
        DialogSexualidad.showCupertinoDialogError(context: context, title: 'Registro de usuario', texto: texto);
      }
    } catch (e) {
      setState(() => loading = false);
      logger.e(e.toString());
      setState(() => loading = false);
    }
  }
}
