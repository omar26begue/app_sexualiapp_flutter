import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sexual_app/helpers/loading.dart';
import 'package:sexual_app/models/model/coins_model.dart';
import 'package:sexual_app/pages/pago/widgets/pago_widget.dart';

class PagoPage extends StatefulWidget {
  PagoPage({Key key}) : super(key: key);

  @override
  _PagoPageState createState() {
    return _PagoPageState();
  }
}

class _PagoPageState extends State<PagoPage> {
  bool isLoading = false;
  int coins = 2000;
  List<CoinsModel> _listCoins = [];

  @override
  void initState() {
    super.initState();

    _listCoins.add(new CoinsModel(coins: 2000, time: Duration(hours: 1), money: 60));
    _listCoins.add(new CoinsModel(coins: 1000, time: Duration(minutes: 30), money: 30));
    _listCoins.add(new CoinsModel(coins: 500, time: Duration(minutes: 15), money: 15));
    _listCoins.add(new CoinsModel(coins: 200, time: Duration(minutes: 10), money: 10));
    _listCoins.add(new CoinsModel(coins: 100, time: Duration(minutes: 5), money: 5));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.0),
                  InkWell(
                    onTap: () => actionBack(),
                    child: Icon(Icons.arrow_back, size: 24.0, color: HexColor('#454F63')),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    'Cuenta',
                    style: TextStyle(
                      fontFamily: 'Quicksand Blod',
                      fontSize: 35.0,
                      color: HexColor('#454F63'),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Comprando 2000 coins',
                    style: TextStyle(
                      fontFamily: 'Quicksand Blod',
                      fontSize: 16.0,
                      color: HexColor('#454F63'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Por 1 consulta',
                        style: TextStyle(
                          fontFamily: 'Quicksand Regular',
                          fontSize: 14.0,
                          color: HexColor('#454F63'),
                        ),
                      ),
                      Text(
                        '60usd',
                        style: TextStyle(
                          fontFamily: 'Quicksand Regular',
                          fontSize: 16.0,
                          color: HexColor('#454F63'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _listCoins.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => actionSelectCoins(_listCoins[index].coins),
                          child: PagoWidget(coins: _listCoins[index], actualCoins: coins),
                        );
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: HexColor('#6F33C7'),
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14.0),
                    child: Text(
                      'Siguiente',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Gibson SemiBlod',
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.0),
                ],
              ),
            ),
            ShowLoadingSexualidad(loading: isLoading),
          ],
        ),
      ),
    );
  }

  void actionSelectCoins(int pConis) {
    setState(() => coins = pConis);
  }

  void actionBack() {
    Navigator.of(context).pop();
  }
}
