import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sexual_app/helpers/dialog.dart';
import 'package:sexual_app/helpers/email.dart';
import 'package:sexual_app/helpers/response.dart';
import 'package:sexual_app/models/providers/model_sexual.dart';
import 'package:sexual_app/models/retrofit/requests/register_request.dart';
import 'package:sexual_app/models/retrofit/responses/orientation_sexual_response.dart';
import 'package:sexual_app/models/retrofit/responses/religion_response.dart';
import 'package:sexual_app/services/api_services.dart';

// ignore: must_be_immutable
class RegisterWidget extends StatefulWidget {
  List<ResponseReligionModel> religion;
  List<ResponseOrientationSexualModel> sexual;
  Function actionChangeTab;

  RegisterWidget({Key key, @required this.religion, @required this.sexual, @required this.actionChangeTab}) : super(key: key);

  @override
  _RegisterWidgetState createState() {
    return _RegisterWidgetState();
  }
}

class _RegisterWidgetState extends State<RegisterWidget> {
  bool loading = false;
  TextEditingController _nameRegister = new TextEditingController();
  TextEditingController _emailRegister = new TextEditingController();
  TextEditingController _passwordRegister = new TextEditingController();
  TextEditingController _ageRegister = new TextEditingController();
  String _itemSex;
  List<DropdownMenuItem<String>> _ddSex = [];
  ResponseReligionModel _itemReligion;
  List<DropdownMenuItem<ResponseReligionModel>> _ddReligion = [];
  ResponseOrientationSexualModel _itemSexual;
  List<DropdownMenuItem<ResponseOrientationSexualModel>> _ddWSexual = [];
  var logger = new Logger();

  @override
  void initState() {
    super.initState();

    _ddSex.add(new DropdownMenuItem<String>(
      value: 'Masculino',
      child: Text(
        'Masculino',
        style: TextStyle(
          color: Colors.black54,
          fontFamily: 'Open Sans Regular',
          fontSize: 14.0,
        ),
      ),
    ));
    _ddSex.add(new DropdownMenuItem<String>(
      value: 'Femenino',
      child: Text(
        'Femenino',
        style: TextStyle(
          color: Colors.black54,
          fontFamily: 'Open Sans Regular',
          fontSize: 14.0,
        ),
      ),
    ));

    for (int index = 0; index < widget.religion.length; index++) {
      _ddReligion.add(new DropdownMenuItem<ResponseReligionModel>(
        value: widget.religion[index],
        child: Text(
          widget.religion[index].name,
          style: TextStyle(
            color: Colors.black54,
            fontFamily: 'Open Sans Regular',
            fontSize: 14.0,
          ),
        ),
      ));
    }

    for (int index = 0; index < widget.sexual.length; index++) {
      _ddWSexual.add(new DropdownMenuItem<ResponseOrientationSexualModel>(
        value: widget.sexual[index],
        child: Text(
          widget.sexual[index].name,
          style: TextStyle(
            color: Colors.black54,
            fontFamily: 'Open Sans Regular',
            fontSize: 14.0,
          ),
        ),
      ));
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: ListView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
              child: TextFormField(
                enabled: !loading,
                controller: _nameRegister,
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
                  hintText: 'Nombre',
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
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
              child: TextFormField(
                enabled: !loading,
                controller: _emailRegister,
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
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
              child: TextFormField(
                enabled: !loading,
                controller: _passwordRegister,
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
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
              child: TextFormField(
                enabled: !loading,
                controller: _ageRegister,
                onFieldSubmitted: (v) {
                  //FocusScope.of(context).requestFocus(_focusContrasena);
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.start,
                cursorColor: HexColor('#665EFF'),
                style: TextStyle(
                    //color: HexColor(color161F3D),
                    ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Edad',
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
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
            child: DropdownButton<String>(
              iconEnabledColor: HexColor('#6F33C7'),
              hint: Text(
                "Sexo",
                style: TextStyle(
                  color: HexColor('#78849E'),
                  fontSize: 15.0,
                  fontFamily: 'Gibson SemiBlod',
                ),
              ),
              value: _itemSex,
              items: _ddSex,
              style: TextStyle(
                fontFamily: 'Open Sans Regular',
                fontSize: 15.0,
                color: Colors.white10,
              ),
              onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
              onChanged: (String value) => setState(() => _itemSex = value),
              isExpanded: true,
            ),
          ),
          SizedBox(height: 24.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
            child: DropdownButton<ResponseReligionModel>(
              iconEnabledColor: HexColor('#6F33C7'),
              hint: Text(
                "Religión",
                style: TextStyle(
                  color: HexColor('#78849E'),
                  fontSize: 15.0,
                  fontFamily: 'Gibson SemiBlod',
                ),
              ),
              value: _itemReligion,
              items: _ddReligion,
              style: TextStyle(
                fontFamily: 'Open Sans Regular',
                fontSize: 15.0,
                color: Colors.white10,
              ),
              onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
              onChanged: (ResponseReligionModel value) => setState(() => _itemReligion = value),
              isExpanded: true,
            ),
          ),
          SizedBox(height: 24.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
            child: DropdownButton<ResponseOrientationSexualModel>(
              iconEnabledColor: HexColor('#6F33C7'),
              hint: Text(
                "Orientación sexual",
                style: TextStyle(
                  color: HexColor('#78849E'),
                  fontSize: 15.0,
                  fontFamily: 'Gibson SemiBlod',
                ),
              ),
              value: _itemSexual,
              items: _ddWSexual,
              style: TextStyle(
                fontFamily: 'Open Sans Regular',
                fontSize: 15.0,
                color: Colors.white10,
              ),
              onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
              onChanged: (ResponseOrientationSexualModel value) => setState(() => _itemSexual = value),
              isExpanded: true,
            ),
          ),
          SizedBox(height: 28.0),
          Text(
            'Pagas con',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Gibson SemiBlod',
              fontSize: 12.0,
              color: HexColor('#78849E'),
            ),
          ),
          SizedBox(height: 13.0),
          Image.asset('assets/img/paypal.png', width: 43.0, height: 42.0),
          SizedBox(height: 36.0),
          loading == false
              ? InkWell(
                  onTap: () => actionRegister(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: HexColor('#6F33C7'),
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 18.0),
                    child: Text(
                      'Registrarse',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Gibson SemiBlod',
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : Center(child: CircularProgressIndicator()),
          SizedBox(height: 36.0),
        ],
      ),
    );
  }

  Future<void> actionRegister() async {
    try {
      ModelSexualProvider model = ScopedModel.of(context);
      FocusScope.of(context).requestFocus(new FocusNode());

      String texto = '';
      if (_nameRegister.text.length < 3)
        texto = 'Nombre de usuario demasiado corto';
      else if (ValidateSexualidad.validateEmail(_emailRegister.text) == false)
        texto = 'Dirección de correo electrónico incorrecta';
      else if (_passwordRegister.text.length <= 5)
        texto = 'Contraseña demasiado corta';
      else if (_ageRegister.text.isEmpty == true) {
        texto = 'La edad mínima para su registro es de 13 años';
      } else if (_ageRegister.text.isNotEmpty == true) {
        if (int.parse(_ageRegister.text) < 13) texto = 'La edad mínima para su registro es de 13 años';
      } else if (_itemSex == null)
        texto = 'Debe seleccionar un sexo';
      else if (_itemReligion == null)
        texto = 'Debe seleccionar una religión para su registro';
      else if (_itemSexual == null) texto = 'Debe seleccionar una orientación sexual';
      if (texto.length > 0) {
        texto += '. Por favor complete los datos para completar su registro en el sistema.';
        DialogSexualidad.showCupertinoDialogError(context: context, title: 'Comprobación', texto: texto);
      }

      if (texto.length == 0) {
        setState(() => loading = true);
        RequestRegisterModel register = new RequestRegisterModel(
          name: _nameRegister.text,
          email: _emailRegister.text,
          password: _passwordRegister.text,
          age: int.parse(_ageRegister.text),
          sex: _itemSex,
          id_religion: _itemReligion.identifier,
          sexual_orientation: _itemSexual.identifier,
        );
        final response = await Provider.of<APISexualidadServices>(context, listen: false).registerUsers(register);
        setState(() => loading = false);

        Response.responseMedical(
          context: context,
          statusCode: response.statusCode,
          logger: logger,
          functionCode: () {
            DialogSexualidad.showCupertinoDialogSuccess(
              context: context,
              title: 'Registro',
              texto: response.body.message,
              btnAceptar: () {
                Navigator.of(context).pop();
                widget.actionChangeTab(model, 'login');
              },
            );
          },
        );
      }
    } catch (e) {
      logger.e(e.toString());
      setState(() => loading = false);
    }
  }
}
