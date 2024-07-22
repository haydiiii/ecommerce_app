import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/services/dio_helper/end_points.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(BaseOptions(baseUrl: EndPoints.baseUrl));
  }

  static Future<Response> getData({
    required String url,
  }) async {
    return await dio!.get(url);
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    if (token != null) {
      dio!.options.headers = {
        'Authorization': 'Bearer $token',
      };
    }

    return await dio!.post(url, data: data);
  }
}
