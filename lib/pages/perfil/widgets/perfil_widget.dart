import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sexual_app/pages/perfil/widgets/datos_personales_widget.dart';

class PerfilWidget extends StatefulWidget {
  PerfilWidget({Key key}) : super(key: key);

  @override
  _PerfilWidgetState createState() {
    return _PerfilWidgetState();
  }
}

class _PerfilWidgetState extends State<PerfilWidget> {
  String opcion = 'datos';

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
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: InkWell(
                  onTap: () => actionOpciones('datos'),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 12.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Datos',
                            style: TextStyle(
                              fontFamily: 'Gibson SemiBlod',
                              fontSize: 13.0,
                              color: opcion == 'datos' ? HexColor('#454F63') : HexColor('#959DAD'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Container(
                        height: 5.0,
                        decoration: BoxDecoration(
                          gradient: opcion == 'datos'
                              ? LinearGradient(
                                  colors: [HexColor('#DB067E'), HexColor('#8B27B4'), HexColor('#6F33C7'), HexColor('#721696'), HexColor('#740477')],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  tileMode: TileMode.clamp,
                                )
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: InkWell(
                  onTap: () => actionOpciones('pago'),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 12.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Medios de pago',
                            style: TextStyle(
                              fontFamily: 'Gibson SemiBlod',
                              fontSize: 13.0,
                              color: opcion == 'pago' ? HexColor('#454F63') : HexColor('#959DAD'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Container(
                        height: 5.0,
                        decoration: BoxDecoration(
                          gradient: opcion == 'pago'
                              ? LinearGradient(
                                  colors: [HexColor('#DB067E'), HexColor('#8B27B4'), HexColor('#6F33C7'), HexColor('#721696'), HexColor('#740477')],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  tileMode: TileMode.clamp,
                                )
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: InkWell(
                  onTap: () => actionOpciones('consultas'),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 12.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Consultas',
                            style: TextStyle(
                              fontFamily: 'Gibson SemiBlod',
                              fontSize: 13.0,
                              color: opcion == 'consultas' ? HexColor('#454F63') : HexColor('#959DAD'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Container(
                        height: 5.0,
                        decoration: BoxDecoration(
                          gradient: opcion == 'consultas'
                              ? LinearGradient(
                                  colors: [HexColor('#DB067E'), HexColor('#8B27B4'), HexColor('#6F33C7'), HexColor('#721696'), HexColor('#740477')],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  tileMode: TileMode.clamp,
                                )
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 21.0),
        opcion == 'datos' ? Column(
          children: [
            DatosPersonalesWidget(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Coins actuales: ',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Gibson Regular',
                          fontSize: 14.0,
                          color: HexColor('#B0BEC5'),
                        ),
                      ),
                      Image.asset('assets/img/coins.png', width: 24.0, height: 24.0),
                      Text(
                        '0',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Gibson Regular',
                          fontSize: 14.0,
                          color: HexColor('#B0BEC5'),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: HexColor('#6F33C7'),
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      'Comprar coins',
                      style: TextStyle(
                        fontFamily: 'Gibson Regular',
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ) : SizedBox(),
      ],
    );
  }

  void actionOpciones(String pOpcion) {
    setState(() => opcion = pOpcion);
  }
}
