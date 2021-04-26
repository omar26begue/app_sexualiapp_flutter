import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sexual_app/helpers/constants/api.dart';
import 'package:sexual_app/models/model/chats_model.dart';

class PerfilDoctorPage extends StatefulWidget {
  PerfilDoctorPage({Key key}) : super(key: key);

  @override
  _PerfilDoctorPageState createState() {
    return _PerfilDoctorPageState();
  }
}

class _PerfilDoctorPageState extends State<PerfilDoctorPage> {
  WebSocket socket;

  @override
  void initState() {
    super.initState();
    initSocket();
  }

  @override
  void dispose() {
    super.dispose();
    closeSocket();
  }

  Future<void> initSocket() async {
    socket = await WebSocket.connect('ws://' + Host + ':' + Port + '/ws/chats');
    ChatsModel chats = new ChatsModel(from: 'prueba', to: 'prueba to', data: 'prueba de textro');
    socket.add(jsonEncode(chats));
    socket.listen((event) {
      print(event.toString());
    });
  }

  Future<void> closeSocket() async {
    await socket.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: HexColor('#6F33C7'),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 10.0),
                  Expanded(
                    flex: 3,
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            width: 224.0,
                            height: 224.0,
                            decoration: BoxDecoration(
                              color: HexColor('#EF5EA7').withOpacity(0.15),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(height: 10.0),
                            Image.asset('assets/img/doctora.png'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(15.0), topLeft: Radius.circular(15.0))
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 10.0,
                left: 24.0,
                child: Icon(Icons.arrow_back, color: Colors.white, size: 24.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
