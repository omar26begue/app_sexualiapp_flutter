import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:sexual_app/helpers/constants/api.dart';
import 'package:sexual_app/models/retrofit/responses/articles_response.dart';
import 'package:sexual_app/pages/articles/pages/articles_details_page.dart';
import 'package:share/share.dart';

// ignore: must_be_immutable
class ArticlesWidget extends StatefulWidget {
  ResponseArticlesModel article;

  ArticlesWidget({Key key, @required this.article}) : super(key: key);

  @override
  _ArticlesWidgetState createState() {
    return _ArticlesWidgetState();
  }
}

class _ArticlesWidgetState extends State<ArticlesWidget> {
  bool expanded = false;

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
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      padding: EdgeInsets.all(11.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => actionArticlesDetails(),
                child: Image.asset('assets/img/doctor.png', width: 51.0, height: 51.0),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => actionArticlesDetails(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.article.title,
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
              ),
              InkWell(
                onTap: () => actionExpanded(),
                child: expanded == false
                    ? Icon(Icons.keyboard_arrow_down_outlined, color: HexColor('#78849E'), size: 24.0)
                    : Container(
                        decoration: BoxDecoration(
                          color: HexColor('#6F33C7'),
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Solicita\nasesoria',
                          style: TextStyle(
                            fontFamily: 'Gibson Regular',
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
              ),
            ],
          ),
          SizedBox(height: 17.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.article.sub_title,
                  textAlign: TextAlign.start,
                  maxLines: 4,
                  style: TextStyle(
                    fontFamily: 'Gibson Regular',
                    fontSize: 14.0,
                    color: HexColor('#78849E'),
                  ),
                ),
                widget.article.image_sub_title != null
                    ? Column(
                        children: [
                          SizedBox(height: 10.0),
                          CachedNetworkImage(
                            imageUrl: APIProduction + '/api/images/articles/subtitle/' + widget.article.identifier + '/photo',
                            width: MediaQuery.of(context).size.width,
                            height: 175.0,
                            fit: BoxFit.fill,
                          ),
                        ],
                      )
                    : SizedBox(),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => actionShare(),
                      child: Icon(Icons.share_outlined, size: 24.0, color: HexColor('#78849E')),
                    ),
                    Row(
                      children: [
                        Text(
                          '428',
                          style: TextStyle(
                            fontFamily: 'Gibson SemiBlod',
                            fontSize: 12.0,
                            color: HexColor('#78849E'),
                          ),
                        ),
                        SvgPicture.asset('assets/img/icons-like.svg', width: 24.0, height: 24.0),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void actionShare() {
    if (widget.article.image_sub_title != null) {
      Share.shareFiles(
        [APIProduction + '/api/images/articles/subtitle/' + widget.article.identifier + '/photo'],
        text: widget.article.sub_title,
        subject: widget.article.title,
      );
    } else {
      Share.share(widget.article.sub_title, subject: widget.article.title);
    }
  }

  void actionExpanded() {
    setState(() => expanded = !expanded);
  }

  void actionArticlesDetails() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ArticlesDetailsPage(article: widget.article);
    }));
  }
}
