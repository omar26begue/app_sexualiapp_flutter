import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sexual_app/helpers/loading.dart';
import 'package:sexual_app/helpers/response.dart';
import 'package:sexual_app/models/providers/model_sexual.dart';
import 'package:sexual_app/models/retrofit/responses/orientation_sexual_response.dart';
import 'package:sexual_app/models/retrofit/responses/religion_response.dart';
import 'package:sexual_app/pages/registro/widgets/login_widget.dart';
import 'package:sexual_app/pages/registro/widgets/register_widget.dart';
import 'package:sexual_app/services/api_services.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  String activo = 'login';
  bool isLoading = false;
  var logger = new Logger();
  List<ResponseReligionModel> _listReligion = [];
  List<ResponseOrientationSexualModel> _listSexual = [];

  @override
  void initState() {
    super.initState();
    loadReligion();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> loadReligion() async {
    try {
      setState(() => isLoading = true);
      final response = await Provider.of<APISexualidadServices>(context, listen: false).getReligion();

      Response.responseMedical(
        context: context,
        statusCode: response.statusCode,
        logger: logger,
        functionCode: () {
          setState(() => _listReligion = response.body);
          loadOrientationSexual();
        },
      );
    } catch (e) {
      setState(() => isLoading = false);
      logger.e(e.toString());
    }
  }

  Future<void> loadOrientationSexual() async {
    try {
      final response = await Provider.of<APISexualidadServices>(context, listen: false).getOrientationSexual();
      setState(() => isLoading = false);

      Response.responseMedical(
        context: context,
        statusCode: response.statusCode,
        logger: logger,
        functionCode: () {
          setState(() => _listSexual = response.body);
        },
      );
    } catch (e) {
      setState(() => isLoading = false);
      logger.e(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ModelSexualProvider>(
      builder: (BuildContext context, Widget child, ModelSexualProvider model) {
        return Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration:
                                BoxDecoration(image: DecorationImage(image: Image.asset('assets/img/back_login1.png').image, fit: BoxFit.fill)),
                            child: Column(
                              children: [
                                SizedBox(height: 71.0),
                                SvgPicture.asset('assets/img/icon.svg', width: 120.0, height: 80.0),
                                SizedBox(height: 18.0),
                                Text(
                                  'sexualidapp',
                                  style: TextStyle(
                                    fontFamily: 'Gibson Light',
                                    fontSize: 32.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 17.0),
                        Expanded(
                          flex: 7,
                          child: Column(
                            children: [
                              SizedBox(height: 30.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: GestureDetector(
                                      onTap: () => actionChangeTab(model, 'login'),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Ingresar',
                                            style: TextStyle(
                                              fontFamily: 'Gibson SemiBlod',
                                              fontSize: 13.0,
                                              color: model.getTabLogin == 'login' ? HexColor('#454F63') : HexColor('#959DAD'),
                                            ),
                                          ),
                                          SizedBox(height: 10.0),
                                          Container(
                                            width: MediaQuery.of(context).size.width,
                                            height: 6.0,
                                            decoration: BoxDecoration(color: model.getTabLogin == 'login' ? HexColor('#900794') : Colors.transparent),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: GestureDetector(
                                      onTap: () => actionChangeTab(model, 'register'),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Registrarse',
                                            style: TextStyle(
                                              fontFamily: 'Gibson SemiBlod',
                                              fontSize: 13.0,
                                              color: model.getTabLogin != 'login' ? HexColor('#454F63') : HexColor('#959DAD'),
                                            ),
                                          ),
                                          SizedBox(height: 10.0),
                                          Container(
                                            width: MediaQuery.of(context).size.width,
                                            height: 6.0,
                                            decoration: BoxDecoration(color: model.getTabLogin != 'login' ? HexColor('#900794') : Colors.transparent),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                  child: model.getTabLogin == 'login'
                                      ? LoginWidget()
                                      : RegisterWidget(
                                          religion: _listReligion,
                                          sexual: _listSexual,
                                          actionChangeTab: actionChangeTab,
                                        )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    ShowLoadingSexualidad(loading: isLoading),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void actionChangeTab(ModelSexualProvider model, String tab) {
    model.setTabLogin(tab);
  }
}
