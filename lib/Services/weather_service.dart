import 'package:dio/dio.dart';

import '../Model/weather_model.dart';

class WeatherService {
  final Dio _dio = Dio();
  final String apiKey = 'f0c09f559b654b048ff170903240108';

  Future<WeatherModel> fetchWeather(String location) async {
    try {
      final response = await _dio.get(
        'http://api.weatherapi.com/v1/current.json',
        queryParameters: {
          'key': apiKey,
          'q': location,
        },
      );
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load weather data');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized: Please check your API key.');
      } else {
        throw Exception('Network Error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
