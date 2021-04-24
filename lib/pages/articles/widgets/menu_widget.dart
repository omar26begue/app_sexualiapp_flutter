import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sexual_app/helpers/constants/routers.dart';
import 'package:sexual_app/helpers/dialog.dart';
import 'package:sexual_app/helpers/session_manager.dart';
import 'package:sexual_app/pages/articles/widgets/item_menu_widget.dart';

class MenuWidget extends StatefulWidget {
  MenuWidget({Key key}) : super(key: key);

  @override
  _MenuWidgetState createState() {
    return _MenuWidgetState();
  }
}

class _MenuWidgetState extends State<MenuWidget> {
  String name = '', email = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getData() async {
    name = await SessionManagerSexualidad().getName();
    email = await SessionManagerSexualidad().getEmail();
    setState(() {
      name = name;
      email = email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: HexColor('#6F33C7'),
            ),
            child: Column(
              children: [
                SizedBox(height: 27.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(1.0),
                  child: Image.asset('assets/img/perfil1.png', width: 97.0, height: 97.0),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'Gibson SemiBlod',
                          fontSize: 24.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        email,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'Gibson SemiBlod',
                          fontSize: 14.0,
                          color: Colors.white.withOpacity(0.56),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              children: [
                Expanded(
                  flex: 9,
                  child: Column(
                    children: [
                      ItemMenuWidget(name: 'Perfil', icon: 'assets/img/perfil.svg'),
                      SizedBox(height: 40.0),
                      ItemMenuWidget(name: 'Consultas', icon: 'assets/img/consultas.svg'),
                      SizedBox(height: 40.0),
                      ItemMenuWidget(name: 'Pagos', icon: 'assets/img/pagos.svg'),
                      SizedBox(height: 40.0),
                      ItemMenuWidget(name: 'Sobre la app', icon: 'assets/img/app.svg'),
                      SizedBox(height: 40.0),
                      ItemMenuWidget(name: 'Políticas de privacidad', icon: 'assets/img/privacidad.svg'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () => actionCerrarSession(),
                        child: ItemMenuWidget(name: 'Cerrar sessión', icon: 'assets/img/session.svg'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void actionCerrarSession() {
    DialogSexualidad.showCupertinoDialogSiNo(
      context: context,
      title: 'Confirmación',
      texto: 'Está seguro que desea salir de la aplicación.',
      btnAceptar: () {
        Navigator.pushReplacementNamed(context, pageSplash);
      },
    );
  }
}
