import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:sexual_app/helpers/response.dart';
import 'package:sexual_app/helpers/session_manager.dart';
import 'package:sexual_app/models/retrofit/requests/image_users_request.dart';
import 'package:sexual_app/models/retrofit/responses/perfil_response.dart';
import 'package:sexual_app/pages/perfil/widgets/edit_perfil_widget.dart';
import 'package:sexual_app/pages/perfil/widgets/perfil_widget.dart';
import 'package:sexual_app/services/api_services.dart';

class PerfilPage extends StatefulWidget {
  PerfilPage({Key key}) : super(key: key);

  @override
  _PerfilPageState createState() {
    return _PerfilPageState();
  }
}

class _PerfilPageState extends State<PerfilPage> {
  bool imagePerfil = false, loading = false, editPerfil = false;
  List<String> images = [];
  var logger = new Logger();
  ResponsePerfilModel perfil = new ResponsePerfilModel(name: '', age: 0, email: '');

  @override
  void initState() {
    super.initState();

    images.add('assets/img/perfil1.png');
    images.add('assets/img/perfil2.png');
    images.add('assets/img/perfil3.png');
    images.add('assets/img/perfil4.png');
    images.add('assets/img/perfil5.png');
    images.add('assets/img/perfil6.png');

    setState(() => images = images);

    getPerfil();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getPerfil() async {
    try {
      setState(() => loading = true);
      String token = await SessionManagerSexualidad().getToken();
      final response = await Provider.of<APISexualidadServices>(context, listen: false).getPerfil(token);
      setState(() => loading = false);

      Response.responseMedical(
        context: context,
        statusCode: response.statusCode,
        logger: logger,
        functionCode: () {
          setState(() => perfil = response.body);
        },
        error: response.error,
        executeError: () {},
      );
    } catch (e) {
      logger.e(e.toString());
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: HexColor('#6F33C7'),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 50.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () => actionBack(),
                            child: Icon(Icons.arrow_back, color: Colors.white, size: 24.0),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          imagePerfil == false
                              ? InkWell(
                                  onTap: () => actionSelectImage(),
                                  child: Container(
                                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                                    padding: EdgeInsets.all(1.0),
                                    child: Image.asset(perfil.image == null ? 'assets/img/perfil1.png' : perfil.image, width: 82.0, height: 102.0),
                                  ),
                                )
                              : Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 100.0,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: images.length,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          SizedBox(width: 10.0),
                                          InkWell(
                                            onTap: () => actionSetImage(images[index]),
                                            child: Image.asset(images[index], width: 67.0, height: 67.0),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                          imagePerfil == false
                              ? Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: InkWell(
                                    onTap: () => actionSelectImage(),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: HexColor('#8452CC'),
                                        shape: BoxShape.circle,
                                      ),
                                      padding: EdgeInsets.all(6.0),
                                      child: Icon(Icons.add, color: Colors.white, size: 18.0),
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 44.0),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(
                            children: [
                              SizedBox(height: 23.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          perfil.name,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontFamily: 'Quicksand Blod',
                                            fontSize: 24.0,
                                            color: HexColor('#454F63'),
                                          ),
                                        ),
                                        Text(
                                          perfil.age == null ? 'Edad sin definir' : perfil.age.toString() + ' años',
                                          style: TextStyle(
                                            fontFamily: 'Gibson Regular',
                                            fontSize: 14.0,
                                            color: HexColor('#78849E'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => actionEditPerfil(),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: HexColor('#6F33C7'),
                                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                                      child: Text(
                                        editPerfil == false ? 'Editar perfil' : 'Cancelar edición',
                                        style: TextStyle(
                                          fontFamily: 'Gibson Regular',
                                          fontSize: 14.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 29.0),
                            ],
                          ),
                        ),
                        editPerfil == false
                            ? Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: HexColor('#6F33C7'),
                                              borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                            ),
                                            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                                            child: Text(
                                              'Hacer una pregunta',
                                              style: TextStyle(
                                                fontFamily: 'Gibson Regular',
                                                fontSize: 14.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              SvgPicture.asset('assets/img/chat.svg', width: 24.0, height: 24.0),
                                              Text(
                                                'Chat',
                                                style: TextStyle(
                                                  fontFamily: 'Gibson Regular',
                                                  fontSize: 13.0,
                                                  color: HexColor('#78849E'),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              SvgPicture.asset('assets/img/email_blue.svg', width: 24.0, height: 18.0),
                                              SizedBox(height: 3.5),
                                              Text(
                                                'Email',
                                                style: TextStyle(
                                                  fontFamily: 'Gibson Regular',
                                                  fontSize: 13.0,
                                                  color: HexColor('#78849E'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 23.0),
                                  PerfilWidget(perfil: perfil),
                                ],
                              )
                            : EditPerfilWidget(perfil: perfil, functionActionEditPerfil: actionEditPerfil),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void actionBack() {
    Navigator.of(context).pop();
  }

  void actionSelectImage() {
    setState(() => imagePerfil = !imagePerfil);
  }

  Future<void> actionSetImage(String image) async {
    try {
      setState(() => loading = true);
      String token = await SessionManagerSexualidad().getToken();
      String identifier = await SessionManagerSexualidad().getUsersIdentifier();
      RequestImageUsersModel imageR = new RequestImageUsersModel(identifier: identifier, image: image);
      final response = await Provider.of<APISexualidadServices>(context, listen: false).setImageUsers(token, imageR);
      setState(() => loading = false);

      Response.responseMedical(
        context: context,
        statusCode: response.statusCode,
        logger: logger,
        functionCode: () {
          setState(() {
            imagePerfil = !imagePerfil;
            perfil.image = image;
          });
        },
        error: response.error,
        executeError: () {},
      );
    } catch (e) {
      logger.e(e.toString());
    }
  }

  void actionEditPerfil() {
    setState(() => editPerfil = !editPerfil);
  }
}
