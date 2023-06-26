abstract class HttpApiServices {
  Future<dynamic> httpGetMethod({required String url,bool haveHeader = false});
  Future<dynamic> httpPostMethod(String url, Map data);
}
