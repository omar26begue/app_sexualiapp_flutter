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

  @override
  Future<Response<ResponseLoginModel>> loginFacebook(
      RequestFacebookModel facebook) {
    final $url = '/api/auth/facebook';
    final $headers = {'Content-Type': 'application/json'};
    final $body = facebook;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<ResponseLoginModel, ResponseLoginModel>($request);
  }

  @override
  Future<Response<ResponseLoginModel>> loginUsers(RequestLoginModel login) {
    final $url = '/api/auth/login';
    final $headers = {'Content-Type': 'application/json'};
    final $body = login;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<ResponseLoginModel, ResponseLoginModel>($request);
  }

  @override
  Future<Response<List<ResponseArticlesModel>>> getArticles(String token) {
    final $url = '/api/v1/articles';
    final $headers = {
      'Authorization': token,
      'Content-Type': 'application/json'
    };
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client
        .send<List<ResponseArticlesModel>, ResponseArticlesModel>($request);
  }

  @override
  Future<Response<ResponseAPIModel>> setImageUsers(
      String token, RequestImageUsersModel image) {
    final $url = '/api/v1/users/image';
    final $headers = {
      'Authorization': token,
      'Content-Type': 'application/json'
    };
    final $body = image;
    final $request =
        Request('PATCH', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<ResponseAPIModel, ResponseAPIModel>($request);
  }
}
