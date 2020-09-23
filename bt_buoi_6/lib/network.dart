import 'package:bt_buoi_6/model/country.dart';
import 'package:dio/dio.dart';

class Network {
  static Network _instance;

  static Network get instance => _instance ?? Network._internal();
  Dio _dio;

  Network._internal() {
    _dio = Dio();
    _dio.options.baseUrl = "https://restcountries.eu/rest/v2";
    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  Future<List<Country>> getCountriesByRegion({String region = "asia"}) async {
    Response response = await _dio.get("/region/$region");
    return Country.listCountries(response.data);
  }
}
