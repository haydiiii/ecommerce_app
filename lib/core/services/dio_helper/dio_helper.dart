import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/services/dio_helper/end_points.dart';

class DioHelper {
  static Dio? dio;
  int? id;
  // DioHelper({this.id});

  static  void init() {
    dio = Dio(BaseOptions(baseUrl: EndPoints.baseUrl, headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    }, ));
  }

  static Future<Response> getData({
    
    required String url,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    try {
      if (token != null) {
        dio!.options.headers['Authorization'] = 'Bearer $token';
      } else {
        dio!.options.headers.remove('Authorization');
      }
      return await dio!.get(url, queryParameters: query);
    } catch (e) {
      log("Exception: $e");
      rethrow;
    }
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    try {
      if (token != null) {
        dio!.options.headers['Authorization'] = 'Bearer $token';
      } else {
        dio!.options.headers.remove('Authorization');
      }
      return await dio!.post(url, data: data);
    } catch (e) {
      log("Exception: $e");
      rethrow;
    }
  }
  static Future<Response> postMultiPartData({
    required String url,
    required FormData data,
    String? token,
  }) async {
    try {
      if (token != null) {
        dio!.options.headers['Authorization'] = 'Bearer $token';
      } else {
        dio!.options.headers.remove('Authorization');
      }
      return await dio!.post(url, data: data);
    } catch (e) {
      log("Exception: $e");
      rethrow;
    }
  }
 
  
}
