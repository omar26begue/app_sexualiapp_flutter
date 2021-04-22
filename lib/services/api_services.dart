import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:sexual_app/helpers/constants/api.dart';
import 'package:sexual_app/models/retrofit/requests/register_request.dart';
import 'package:sexual_app/models/retrofit/responses/orientation_sexual_response.dart';
import 'package:sexual_app/models/retrofit/responses/religion_response.dart';
import 'package:sexual_app/models/retrofit/responses/response_api.dart';

part 'api_services.chopper.dart';

@ChopperApi(baseUrl: '/api')
abstract class APISexualidadServices extends ChopperService {

  /// Devuelve un listado de religiones
  @Get(headers: {'Content-Type': 'application/json'}, path: "/religions")
  Future<Response<List<ResponseReligionModel>>> getReligion();

  @Get(headers: {'Content-Type': 'application/json'}, path: "/sexual")
  Future<Response<List<ResponseOrientationSexualModel>>> getOrientationSexual();

  @Post(headers: {'Content-Type': 'application/json'}, path: "/auth/register")
  Future<Response<ResponseAPIModel>> registerUsers(@Body() RequestRegisterModel register);

  static APISexualidadServices create() {
    final client = ChopperClient(
      baseUrl: APIProduction,
      services: [_$APISexualidadServices()],
      converter: JsonToTypeConverter({
        ResponseAPIModel: (jsonData) => ResponseAPIModel.fromJson(jsonData),
        ResponseReligionModel: (jsonData) => ResponseReligionModel.fromJson(jsonData),
        ResponseOrientationSexualModel: (jsonData) => ResponseOrientationSexualModel.fromJson(jsonData),
      }),
    );

    return _$APISexualidadServices(client);
  }
}

class JsonToTypeConverter extends JsonConverter {
  final Map<Type, Function> typeToJsonFactoryMap;

  JsonToTypeConverter(this.typeToJsonFactoryMap);

  T fromJsonData<T, InnerType>(String jsonData, Function jsonParse) {
    var jsonMap = json.decode(jsonData);

    if (jsonMap is List) {
      return jsonMap.map((item) => jsonParse(item as Map<String, dynamic>) as InnerType).toList() as T;
    }

    return jsonParse(jsonMap);
  }

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    // ignore: deprecated_member_use
    return response.replace(
      body: fromJsonData<BodyType, InnerType>(response.body, typeToJsonFactoryMap[InnerType]),
    );
  }
}