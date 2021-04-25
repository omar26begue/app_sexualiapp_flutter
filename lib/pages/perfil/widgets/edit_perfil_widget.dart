import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:sexual_app/helpers/email.dart';
import 'package:sexual_app/helpers/response.dart';
import 'package:sexual_app/helpers/session_manager.dart';
import 'package:sexual_app/models/retrofit/requests/register_request.dart';
import 'package:sexual_app/models/retrofit/responses/orientation_sexual_response.dart';
import 'package:sexual_app/models/retrofit/responses/perfil_response.dart';
import 'package:sexual_app/models/retrofit/responses/religion_response.dart';
import 'package:sexual_app/services/api_services.dart';

// ignore: must_be_immutable
class EditPerfilWidget extends StatefulWidget {
  ResponsePerfilModel perfil;
  Function functionActionEditPerfil;

  EditPerfilWidget({Key key, @required this.perfil, @required this.functionActionEditPerfil}) : super(key: key);

  @override
  _EditPerfilWidgetState createState() {
    return _EditPerfilWidgetState();
  }
}

class _EditPerfilWidgetState extends State<EditPerfilWidget> {
  bool isLoading = false;
  TextEditingController _nameRegister = new TextEditingController();
  TextEditingController _emailRegister = new TextEditingController();
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

    setState(() {
      _nameRegister.text = widget.perfil.name;
      _emailRegister.text = widget.perfil.email;
      if (widget.perfil.age != null) _ageRegister.text = widget.perfil.age.toString();
      if (widget.perfil.sex != null) _itemSex = widget.perfil.sex;
    });

    loadReligion();

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
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> loadReligion() async {
    try {
      setState(() => isLoading = true);
      final response = await Provider.of<APISexualidadServices>(context, listen: false).getReligion();

      Response.responseMedical(
        context: context,
        statusCode: response.statusCode,
        logger: logger,
        functionCode: () {
          for (int index = 0; index < response.body.length; index++) {
            _ddReligion.add(new DropdownMenuItem<ResponseReligionModel>(
              value: response.body[index],
              child: Text(
                response.body[index].name,
                style: TextStyle(
                  color: Colors.black54,
                  fontFamily: 'Open Sans Regular',
                  fontSize: 14.0,
                ),
              ),
            ));

            if (response.body[index].identifier == widget.perfil.id_religion) {
              setState(() => _itemReligion = response.body[index]);
            }
          }

          loadOrientationSexual();
        },
      );
    } catch (e) {
      setState(() => isLoading = false);
      logger.e(e.toString());
    }
  }

  Future<void> loadOrientationSexual() async {
    try {
      final response = await Provider.of<APISexualidadServices>(context, listen: false).getOrientationSexual();
      setState(() => isLoading = false);

      Response.responseMedical(
        context: context,
        statusCode: response.statusCode,
        logger: logger,
        functionCode: () {
          for (int index = 0; index < response.body.length; index++) {
            _ddWSexual.add(new DropdownMenuItem<ResponseOrientationSexualModel>(
              value: response.body[index],
              child: Text(
                response.body[index].name,
                style: TextStyle(
                  color: Colors.black54,
                  fontFamily: 'Open Sans Regular',
                  fontSize: 14.0,
                ),
              ),
            ));

            if (response.body[index].identifier == widget.perfil.sexual_orientation) {
              setState(() => _itemSexual = response.body[index]);
            }
          }
        },
      );
    } catch (e) {
      setState(() => isLoading = false);
      logger.e(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
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
                  enabled: !isLoading,
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
            SizedBox(height: 12.0),
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
                  enabled: !isLoading,
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
            SizedBox(height: 12.0),
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
                  enabled: !isLoading,
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
            SizedBox(height: 12.0),
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
            SizedBox(height: 12.0),
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
            SizedBox(height: 12.0),
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
            SizedBox(height: 36.0),
            isLoading == false
                ? InkWell(
                    onTap: () => actionSavePerfil(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: HexColor('#6F33C7'),
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 18.0),
                      child: Text(
                        'Guardar',
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
            SizedBox(height: 12.0),
          ],
        ),
      ),
    );
  }

  Future<void> actionSavePerfil() async {
    try {
      if (_nameRegister.text.length > 3 &&
          ValidateSexualidad.validateEmail(_emailRegister.text) &&
          _ageRegister.text.isNotEmpty &&
          _itemSex != null &&
          _itemReligion != null &&
          _itemSexual != null &&
          int.parse(_ageRegister.text) > 12) {
        setState(() => isLoading = true);
        String token = await SessionManagerSexualidad().getToken();
        String identifier = await SessionManagerSexualidad().getUsersIdentifier();
        RequestRegisterModel users = new RequestRegisterModel(
          name: _nameRegister.text,
          email: _emailRegister.text,
          age: int.parse(_ageRegister.text),
          id_religion: _itemReligion.identifier,
          sex: _itemSex,
          sexual_orientation: _itemSexual.identifier,
        );
        final response = await Provider.of<APISexualidadServices>(context, listen: false).setUsers(token, identifier, users);
        setState(() => isLoading = false);

        Response.responseMedical(
          context: context,
          statusCode: response.statusCode,
          logger: logger,
          functionCode: () {
            widget.functionActionEditPerfil();
          },
          error: response.error,
          executeError: () {},
        );
      }
    } catch (e) {
      logger.e(e.toString());
      setState(() => isLoading = false);
    }
  }
}
