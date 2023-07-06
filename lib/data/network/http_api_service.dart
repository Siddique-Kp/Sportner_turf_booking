abstract class HttpApiServices {
  Future<dynamic> httpGetMethod({required String url,bool haveHeader = false});
  Future<dynamic> httpPostMethod({required String url,required Map data,bool haveHeader = false});
}
