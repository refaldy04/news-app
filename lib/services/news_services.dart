import 'package:dio/dio.dart';
import 'package:news_app/constants/constants.dart';

class NewsServices {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiUrls.baseUrl,
    responseType: ResponseType.json,
  ));

  fetchNews() async {
    var response = await _dio.get('&language=en');

    return response.data;
  }

  fetchNewsBySearching(String title) async {
    var response = await _dio.get('&language=en&q=$title');

    return response.data;
  }
}
