// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_services.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$APISexualidadServices extends APISexualidadServices {
  _$APISexualidadServices([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = APISexualidadServices;

  @override
  Future<Response<List<ResponseReligionModel>>> getReligion() {
    final $url = '/api/religions';
    final $headers = {'Content-Type': 'application/json'};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client
        .send<List<ResponseReligionModel>, ResponseReligionModel>($request);
  }

  @override
  Future<Response<List<ResponseOrientationSexualModel>>>
      getOrientationSexual() {
    final $url = '/api/sexual';
    final $headers = {'Content-Type': 'application/json'};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<List<ResponseOrientationSexualModel>,
        ResponseOrientationSexualModel>($request);
  }

  @override
  Future<Response<ResponseAPIModel>> registerUsers(
      RequestRegisterModel register) {
    final $url = '/api/auth/register';
    final $headers = {'Content-Type': 'application/json'};
    final $body = register;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<ResponseAPIModel, ResponseAPIModel>($request);
  }
}
