import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogSexualidad {
  static showCupertinoDialogError({@required context, @required String title, @required String texto, Function function}) {
    if (context == null) return null;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Column(
              children: <Widget>[
                SizedBox(height: 12.0),
                Image.asset(
                  'assets/img/app_icon.png',
                  //color: Colors.grey,
                  width: 150.0,
                  height: 100.0,
                ),
                SizedBox(height: 20.0),
                Text(texto)
              ],
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text("Aceptar"),
                onPressed: () {
                  Navigator.of(context).pop();
                  function();
                },
              )
            ],
          );
        });
  }

  static showCupertinoDialogSuccess({context, String title, String texto, Function btnAceptar}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Column(
              children: <Widget>[
                SizedBox(height: 12.0),
                Image.asset(
                  'assets/img/app_icon.png',
                  //color: Colors.grey,
                  width: 150.0,
                  height: 100.0,
                ),
                SizedBox(height: 12.0),
                Text(texto)
              ],
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text("Aceptar"),
                onPressed: btnAceptar,
              )
            ],
          );
        });
  }

  static showCupertinoDialogSiNo({context, String title, String texto, Function btnAceptar}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Column(
              children: <Widget>[
                SizedBox(height: 12.0),
                Image.asset(
                  'assets/img/app_icon.png',
                  //color: Colors.grey,
                  width: 150.0,
                  height: 100.0,
                ),
                SizedBox(height: 12.0),
                Text(texto)
              ],
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                isDestructiveAction: true,
                child: Text("Si"),
                onPressed: btnAceptar,
              ),
              CupertinoDialogAction(
                child: Text("No"),
                isDefaultAction: true,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
