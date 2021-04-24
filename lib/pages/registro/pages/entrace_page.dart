import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sexual_app/helpers/constants/routers.dart';
import 'package:sexual_app/helpers/response.dart';
import 'package:sexual_app/helpers/session_manager.dart';
import 'package:sexual_app/models/providers/model_sexual.dart';
import 'package:sexual_app/models/retrofit/requests/facebook_request.dart';
import 'package:sexual_app/services/api_services.dart';

class EntracePage extends StatefulWidget {
  EntracePage({Key key}) : super(key: key);

  @override
  _EntracePageState createState() {
    return _EntracePageState();
  }
}

class _EntracePageState extends State<EntracePage> {
  var isLoading = false;
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
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(image: DecorationImage(image: Image.asset('assets/img/back_login.png').image, fit: BoxFit.cover)),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  HexColor('#DB067E').withOpacity(0.5),
                  HexColor('#8B27B4').withOpacity(0.5),
                  HexColor('#6F33C7').withOpacity(0.5),
                  HexColor('#721696').withOpacity(0.5),
                  HexColor('#740477').withOpacity(0.5),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(flex: 4, child: SizedBox()),
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/img/icon.svg', width: 30.0, height: 52.0),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'sexualidapp',
                      style: TextStyle(
                        fontFamily: 'Gibson Light',
                        fontSize: 35.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 44.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'By tapping Log In, you agree with our ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            fontFamily: 'Open Sans Regular',
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Terms of Service',
                              recognizer: TapGestureRecognizer()..onTap = () {},
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontFamily: 'Open Sans Regular',
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(
                              text: ' and ',
                              recognizer: TapGestureRecognizer()..onTap = () {},
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontFamily: 'Open Sans Regular',
                              ),
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              recognizer: TapGestureRecognizer()..onTap = () {},
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontFamily: 'Open Sans Regular',
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 36.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: isLoading == false
                          ? Column(
                              children: [
                                InkWell(
                                  onTap: () => actionFacebook(),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: HexColor('#0070BA'),
                                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 35.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        SvgPicture.asset('assets/img/facebook.svg', width: 9.0, height: 18.0, color: Colors.white),
                                        Text(
                                          'Ingresar con  facebook',
                                          style: TextStyle(
                                            fontFamily: 'Open Sans SemiBlod',
                                            fontSize: 14.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 17.0),
                                InkWell(
                                  onTap: () => actionLogin('login'),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 35.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        SvgPicture.asset('assets/img/email.svg', width: 19.0, height: 12.0, color: HexColor('#707070')),
                                        Text(
                                          'Ingresar con  email',
                                          style: TextStyle(
                                            fontFamily: 'Open Sans SemiBlod',
                                            fontSize: 14.0,
                                            color: HexColor('#707070'),
                                          ),
                                        ),
                                        SizedBox(),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 22.0),
                                GestureDetector(
                                  onTap: () => actionLogin('register'),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'No tienes una cuenta?',
                                        style: TextStyle(
                                          fontFamily: 'Open Sans Regular',
                                          fontSize: 12.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 3.0),
                                      Text(
                                        'Registrarse',
                                        style: TextStyle(
                                          fontFamily: 'Open Sans Blod',
                                          fontSize: 12.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Center(child: CircularProgressIndicator()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void actionLogin(String action) {
    ModelSexualProvider model = ScopedModel.of(context);
    model.setTabLogin(action);

    Navigator.pushReplacementNamed(context, pageLogin);
  }

  Future<void> actionFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login(
        loginBehavior: LoginBehavior.WEB_ONLY,
        permissions: ['public_profile', 'email'],
      );

      if (result.status == LoginStatus.success) {
        setState(() => isLoading = true);
        final AccessToken accessToken = result.accessToken;

        final userData = await FacebookAuth.instance.getUserData();

        RequestFacebookModel facebook = new RequestFacebookModel(
          name: userData['name'],
          email: userData['email'],
          token: accessToken.token,
        );
        final response = await Provider.of<APISexualidadServices>(context, listen: false).loginFacebook(facebook);
        setState(() => isLoading = false);

        Response.responseMedical(
          context: context,
          statusCode: response.statusCode,
          logger: logger,
          functionCode: () {
            SessionManagerSexualidad().setLoginSexualidad(response.body);

            Navigator.pushReplacementNamed(context, pageHome);
          },
          error: response.error,
          executeError: () {},
        );
      }
    } catch (e) {
      setState(() => isLoading = false);
    }
  }
}
