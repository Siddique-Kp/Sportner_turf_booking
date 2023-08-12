import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:sporter_turf_booking/data/app_exceptions.dart';
import 'package:sporter_turf_booking/data/network/http_api_service.dart';
import 'package:sporter_turf_booking/utils/constants.dart';

class NetWorkApiServices extends HttpApiServices {
  @override
  Future<dynamic> httpGetMethod({
    required String url,
    bool haveHeader = false,
  }) async {
    final accessToken = await AccessToken.getAccessToken();

    Map<String, String>? headers =
        haveHeader ? {"Authorization": accessToken!} : {};

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: haveHeader ? headers : null,
      );

      final successResponse = returnResponse(response);

      return successResponse;
    } on SocketException {
      throw "No internet connection";
    }
  }

  @override
  Future<dynamic> httpPostMethod({
    required String url,
    required Map data,
    bool haveHeader = false,
  }) async {
    final accessToken = await AccessToken.getAccessToken();
    Map<String, String>? headers =
        haveHeader ? {"Authorization": accessToken!} : {};
    try {
      final response = await http.post(
        Uri.parse(url),
        body: data,
        headers: haveHeader ? headers : null,
      );

      final successResponse = returnResponse(response);
      return successResponse;
    } on SocketException {
      throw "No internet connection";
    }
  }

  returnResponse(Response response) {
    final jsonBody = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        log("1");
        return response.body;
      case 201:
       log("2");
        return response.body;
      case 400:
       log("3");
        throw BadRequestException(jsonBody["error"]);
      case 401:
       log("4");
        throw UnauthorisedException(jsonBody["message"]);
      case 409:
       log("5");
        throw UnauthorisedException(jsonBody["message"]);
      default:
        log("default");
        throw FetchDataException("Unknown error ${response.statusCode}");
    }
  }
}
