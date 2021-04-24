import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sexual_app/helpers/constants/routers.dart';
import 'package:sexual_app/models/providers/model_sexual.dart';
import 'package:sexual_app/pages/articles/pages/articles_page.dart';
import 'package:sexual_app/pages/registro/pages/entrace_page.dart';
import 'package:sexual_app/pages/registro/pages/login_page.dart';
import 'package:sexual_app/pages/registro/pages/splash_page.dart';
import 'package:sexual_app/services/api_services.dart';

class AppSexualidad extends StatefulWidget {
  AppSexualidad({Key key}) : super(key: key);

  @override
  _AppSexualidadState createState() {
    return _AppSexualidadState();
  }
}

class _AppSexualidadState extends State<AppSexualidad> {
  final ModelSexualProvider _sexualProvider = new ModelSexualProvider();

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
    return Provider(
      create: (_) => APISexualidadServices.create(),
      dispose: (_, APISexualidadServices services) => services.dispose(),
      child: ScopedModel<ModelSexualProvider>(
        model: _sexualProvider,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashPage(),
          routes: <String, WidgetBuilder>{
            pageSplash: (BuildContext context) => SplashPage(),
            pageEntrace: (BuildContext context) => EntracePage(),
            pageLogin: (BuildContext context) => LoginPage(),
            pageHome: (BuildContext context) => ArticlesPage(),
          },
        ),
      ),
    );
  }
}
