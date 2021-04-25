import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sexual_app/pages/perfil/widgets/perfil_widget.dart';

class PerfilPage extends StatefulWidget {
  PerfilPage({Key key}) : super(key: key);

  @override
  _PerfilPageState createState() {
    return _PerfilPageState();
  }
}

class _PerfilPageState extends State<PerfilPage> {
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
                          Container(
                            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                            padding: EdgeInsets.all(1.0),
                            child: Image.asset('assets/img/perfil1.png', width: 82.0, height: 102.0),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: HexColor('#8452CC'),
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(6.0),
                              child: Icon(Icons.add, color: Colors.white, size: 18.0),
                            ),
                          ),
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
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Pablo Shown',
                                        style: TextStyle(
                                          fontFamily: 'Quicksand Blod',
                                          fontSize: 24.0,
                                          color: HexColor('#454F63'),
                                        ),
                                      ),
                                      Text(
                                        '21 años',
                                        style: TextStyle(
                                          fontFamily: 'Gibson Regular',
                                          fontSize: 14.0,
                                          color: HexColor('#78849E'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: HexColor('#6F33C7'),
                                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                                    child: Text(
                                      'Editar perfil',
                                      style: TextStyle(
                                        fontFamily: 'Gibson Regular',
                                        fontSize: 14.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 29.0),
                            ],
                          ),
                        ),
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
                        PerfilWidget(),
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
}
