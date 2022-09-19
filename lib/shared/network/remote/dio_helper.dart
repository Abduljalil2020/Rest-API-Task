import 'package:dio/dio.dart';

import '../end_points.dart';
//https://api.ghanmeen.com/
// api/v1/auth/phone/driver-signing-in
class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: BASEURL,
        receiveDataWhenStatusError: true,

      ),

    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
   // String lang = 'en',
    String? token,
  }) async {

    dio.options.headers = {
      'Authorization': token == null ? "" : "Bearer " + token,
      'X-Requested-With': 'XMLHttpRequest',
      'Content-Type': 'multipart/form-data',
      "Accept": "application/json",
    };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }


  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    // String lang = 'en',
     String? token,
  }) async
  {
    dio.options.headers =
    {
      'Authorization': token == null ? "" : "Bearer " + token,
      'X-Requested-With': 'XMLHttpRequest',
      'Content-Type': 'multipart/form-data',
      "Accept": "application/json",
      // 'Content-Type':'application/json',
      // 'lang':lang,
      // 'Authorization': token,
    };

    return dio.post(
      url,
      queryParameters: query,
      data: FormData.fromMap(data),
    );
  }


  // static Future<Response> putData({
  //   required String url,
  //   Map<String, dynamic>? query,
  //   required Map<String, dynamic> data,
  //   String lang = 'en',
  //   String? token,
  // }) async
  // {
  //   dio.options.headers =
  //   {
  //     'Content-Type':'application/json',
  //     'lang':lang,
  //     'Authorization': token,
  //   };
  //
  //   return dio.put(
  //     url,
  //     queryParameters: query,
  //     data: data,
  //   );
  // }



}
