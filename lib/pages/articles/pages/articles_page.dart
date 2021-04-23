import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:sexual_app/helpers/loading.dart';
import 'package:sexual_app/helpers/response.dart';
import 'package:sexual_app/helpers/session_manager.dart';
import 'package:sexual_app/models/retrofit/requests/login_request.dart';
import 'package:sexual_app/models/retrofit/responses/articles_response.dart';
import 'package:sexual_app/pages/articles/widgets/articles_widget.dart';
import 'package:sexual_app/pages/articles/widgets/categories_widget.dart';
import 'package:sexual_app/services/api_services.dart';

class ArticlesPage extends StatefulWidget {
  ArticlesPage({Key key}) : super(key: key);

  @override
  _ArticlesPageState createState() {
    return _ArticlesPageState();
  }
}

class _ArticlesPageState extends State<ArticlesPage> {
  bool loading = false;
  var logger = new Logger();
  List<ResponseArticlesModel> listArticles = [];

  @override
  void initState() {
    super.initState();
    loadArticles();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> loadArticles() async {
    try {
      setState(() => loading = true);
      String token = await SessionManagerSexualidad().getToken();
      final response = await Provider.of<APISexualidadServices>(context, listen: false).getArticles(token);
      setState(() => loading = false);

      Response.responseMedical(
        context: context,
        statusCode: response.statusCode,
        logger: logger,
        functionCode: () {
          setState(() => listArticles = response.body);
        },
        error: response.error,
        executeError: () {},
      );
    } catch (e) {
      setState(() => loading = false);
      logger.e(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.0),
                  Text(
                    'Artículos',
                    style: TextStyle(
                      fontFamily: 'Quicksand Blod',
                      fontSize: 35.0,
                      color: HexColor('#454F63'),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'CATEGORÍAS'.toUpperCase(),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Quicksand Regular',
                      fontSize: 14.0,
                      color: HexColor('#454F63'),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      SizedBox(width: 10.0),
                      CategoriesWidget(
                        texto: 'Hombres',
                        icon: 'assets/img/man.svg',
                      ),
                      SizedBox(width: 10.0),
                      CategoriesWidget(texto: 'Mujeres', icon: 'assets/img/woman.svg'),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Expanded(
                    child: ListView.separated(
                      itemCount: listArticles.length,
                      itemBuilder: (context, index) {
                        return ArticlesWidget(article: listArticles[index]);
                      }, separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 12.0);
                    },
                    ),
                  ),
                ],
              ),
              ShowLoadingSexualidad(loading: loading),
            ],
          ),
        ),
      ),
    );
  }
}
