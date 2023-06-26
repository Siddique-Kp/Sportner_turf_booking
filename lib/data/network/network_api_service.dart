import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:sporter_turf_booking/data/app_exceptions.dart';
import 'package:sporter_turf_booking/data/network/http_api_service.dart';
import 'package:sporter_turf_booking/utils/constants.dart';

class NetWorkApiServices extends HttpApiServices {
  @override
  Future httpGetMethod({required String url,bool haveHeader = false}) async {
    final accessToken = await AccessToken.getAccessToken();
    Map<String, String>? headers = {"Authorization": accessToken!};

    try {
      final response = await http.get(Uri.parse(url),
          headers: haveHeader ? headers : null);

      final successResponse = returnResponse(response);

      return successResponse;
    } on SocketException {
      throw "No internet connection";
    }
  }

  @override
  Future httpPostMethod(String url, Map data) {
    // TODO: implement httpPostMethod
    throw UnimplementedError();
  }

  returnResponse(Response response) {
    final jsonBody = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        return response.body;
      case 201:
        return response.body;
      case 400:
        throw BadRequestException(jsonBody["error"]);
      case 401:
        throw UnauthorisedException(jsonBody["msg"]);
      default:
        throw FetchDataException("Unknown error ${response.statusCode}");
    }
  }
}
