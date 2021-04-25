import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sexual_app/models/model/coins_model.dart';

class PagoWidget extends StatefulWidget {
  CoinsModel coins;
  int actualCoins;

  PagoWidget({Key key, @required this.coins, @required this.actualCoins}) : super(key: key);

  @override
  _PagoWidgetState createState() {
    return _PagoWidgetState();
  }
}

class _PagoWidgetState extends State<PagoWidget> {
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
          decoration: BoxDecoration(
            color: widget.actualCoins == widget.coins.coins ? HexColor('#6F33C7') : Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Comprar ' + widget.coins.coins.toString() + ' coins',
                    style: TextStyle(
                      fontFamily: 'Quicksand Blod',
                      fontSize: 16.0,
                      color: widget.actualCoins == widget.coins.coins ? HexColor('#B0BEC5') : HexColor('#454F63'),
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Por ' +
                        (widget.coins.time.inHours > 0
                            ? widget.coins.time.inHours.toString() + ' hora consulta'
                            : widget.coins.time.inMinutes.toString() + ' min consulta'),
                    style: TextStyle(
                      fontFamily: 'Gibson Regular',
                      fontSize: 16.0,
                      color: widget.actualCoins == widget.coins.coins ? Colors.white : HexColor('#454F63'),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset('assets/img/coins.png', width: 24.0, height: 24.0),
                  SizedBox(height: 2.0),
                  Text(
                    widget.coins.money.toString() + 'usd',
                    style: TextStyle(
                      fontFamily: 'Gibson Regular',
                      fontSize: 14.0,
                      color: widget.actualCoins == widget.coins.coins ? Colors.white : HexColor('#454F63'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 18.0),
      ],
    );
  }
}
