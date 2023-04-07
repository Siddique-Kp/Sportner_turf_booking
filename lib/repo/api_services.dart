import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';
import 'api_status.dart';

class ApiServices {
  static Future<Object> postMethod(
    String url,
    Map body,
    Function function,
  ) async {
    try {
      final response = await http.post(Uri.parse(url), body: body);

      if (response.statusCode == 201 || response.statusCode == 200) {
        log("Success");
        return Success(response: function(response.body));
      }

      log(response.body.toLowerCase());
      log(response.statusCode.toString());

      return Failure(
        code: response.statusCode,
        errorResponse: "Invalid Response",
      );
    } on HttpException {
      log("HttpException");
      return Failure(
        code: InvalidRespons.kNOINTERNET,
        errorResponse: "No internet",
      );
    } on FormatException {
      log("FormatException");

      return Failure(
        code: InvalidRespons.kINVALIDFORMAT,
        errorResponse: "Invalid Format",
      );
    } on SocketException catch (e) {
      log("SocketException");
      log(e.message);
      return Failure(
        code: InvalidRespons.kNOINTERNET,
        errorResponse: "No internet",
      );
    } on TimeoutException {
      log("TimeoutException");

      return Failure(
        code: InvalidRespons.kTIMEOUT,
        errorResponse: "Time out try again",
      );
    } catch (e) {
      log("Failure");

      return Failure(
        code: InvalidRespons.kUNKNOWNERROR,
        errorResponse: "Unknown Error",
      );
    }
  }
}
