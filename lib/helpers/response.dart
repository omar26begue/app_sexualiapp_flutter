import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sexual_app/helpers/constants/routers.dart';
import 'package:sexual_app/helpers/dialog.dart';
import 'package:sexual_app/helpers/session_manager.dart';

class Response {
  static responseMedical({@required context, @required int statusCode, @required Logger logger, @required Function functionCode, error, Function executeResponse, Function executeError}) {
    if (logger != null) logger.i(statusCode);

    if (executeResponse != null) {
      executeResponse();
    }

    switch (statusCode) {
      case 200:
      case 201:
      case 204:
        functionCode();
        break;

      case 400:
        DialogSexualidad.showCupertinoDialogError(
          context: context,
          title: 'Información.',
          texto: json.decode(error)['message'],
          function: () => executeError(),
        );
        break;

      case 401:
        DialogSexualidad.showCupertinoDialogError(
          context: context,
          title: 'Autentificación',
          texto: 'Lo sentimos no se encuentra autenticado en nuestra aplicación.',
          function: () {
            SessionManagerSexualidad().clearPrefSexualidad();
            Navigator.of(context).pushReplacementNamed(pageEntrace);
          },
        );
        break;

      default:
        DialogSexualidad.showCupertinoDialogError(
          context: context,
          title: 'Error de la aplicación',
          texto: 'Lo sentimos ha ocurrido un error inesperado en la aplicación. Consulte a los administradores del sistema.',
          function: () => executeError(),
        );
        break;
    }
  }
}
