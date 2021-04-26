import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:sexual_app/models/retrofit/responses/articles_response.dart';
import 'package:sexual_app/pages/articles/widgets/categories_widget.dart';
import 'package:sexual_app/pages/perfil/pages/perfil_doctor_page.dart';

// ignore: must_be_immutable
class ArticlesDetailsPage extends StatefulWidget {
  ResponseArticlesModel article;

  ArticlesDetailsPage({Key key, @required this.article}) : super(key: key);

  @override
  _ArticlesDetailsPageState createState() {
    return _ArticlesDetailsPageState();
  }
}

class _ArticlesDetailsPageState extends State<ArticlesDetailsPage> {
  bool expanded = false;
  var logger = new Logger();

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
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: expanded == false ? 9 : 7,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              InkWell(
                                onTap: () => actionBack(),
                                child: Icon(Icons.arrow_back, color: HexColor('#454F63'), size: 24.0),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.0),
                          Row(
                            children: [
                              Text(
                                'Artículo',
                                style: TextStyle(
                                  fontFamily: 'Quicksand Blod',
                                  fontSize: 35.0,
                                  color: HexColor('#454F63'),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: InkWell(
                                  onTap: () => actionPerfilDoctor(),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/img/doctor.png', width: 51.0, height: 51.0),
                                      Flexible(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.article.doctor_article,
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontFamily: 'Gibson SemiBlod',
                                                fontSize: 16.0,
                                                color: HexColor('#454F63'),
                                              ),
                                            ),
                                            SizedBox(height: 4.0),
                                            Text(
                                              DateFormat('EEEE, d MMM, yyyy').format(widget.article.date_article),
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontFamily: 'Gibson Regular',
                                                fontSize: 12.0,
                                                color: HexColor('#454F63'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              CategoriesWidget(texto: 'Hombres', icon: 'assets/img/man.svg', categories: 'man', active: 'man'),
                            ],
                          ),
                          SizedBox(height: 39.0),
                          Text(
                            widget.article.title,
                            maxLines: 3,
                            style: TextStyle(
                              fontFamily: 'Gibson Regular',
                              fontSize: 24.0,
                              color: HexColor('#454F63'),
                            ),
                          ),
                          SizedBox(height: 26.0),
                          Text(
                            widget.article.sub_title,
                            style: TextStyle(
                              fontFamily: 'Gibson SemiBlod',
                              fontSize: 16.0,
                              color: HexColor('#454F63'),
                            ),
                          ),
                          SizedBox(height: 24.0),
                          Text(
                            widget.article.text_article,
                            style: TextStyle(
                              fontFamily: 'Gibson Regular',
                              fontSize: 14.0,
                              color: HexColor('#78849E'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: expanded == false ? 1 : 3,
                    child: expanded == false
                        ? Column(
                            children: [
                              InkWell(
                                onTap: () => actionExpandedAsesoria(),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  decoration: BoxDecoration(
                                    color: HexColor('#6F33C7'),
                                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 18.0),
                                  child: Text(
                                    'Solicita asesoría',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Gibson SemiBlod',
                                      fontSize: 15.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.0),
                            ],
                          )
                        : Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: HexColor('#6F33C7'),
                              borderRadius: BorderRadius.only(topRight: Radius.circular(15.0), topLeft: Radius.circular(15.0)),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 24.0),
                                Text(
                                  'Precio por consulta básica',
                                  style: TextStyle(
                                    fontFamily: 'Gibson Regular',
                                    fontSize: 14.0,
                                    color: Colors.white.withOpacity(0.56),
                                  ),
                                ),
                                SizedBox(height: 14.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '2000 Coins',
                                      style: TextStyle(
                                        fontFamily: 'Gibson SemiBlod',
                                        fontSize: 22.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Image.asset('assets/img/coins.png', width: 24.0, height: 24.0),
                                  ],
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  'Tiempo estimado | 1hora',
                                  style: TextStyle(
                                    fontFamily: 'Gibson Light',
                                    fontSize: 18.0,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 22.0),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 18.0),
                                    child: Text(
                                      'Comenzar asesoría',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Gibson SemiBlod',
                                        fontSize: 15.0,
                                        color: HexColor('#231F1F'),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void actionBack() {
    Navigator.of(context).pop();
  }

  void actionExpandedAsesoria() {
    setState(() => expanded = !expanded);
  }

  Future<void> actionPerfilDoctor() async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PerfilDoctorPage();
    }));
  }
}
