import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:miniproject/src/configs/api.dart';
import 'package:miniproject/src/pages/apm/amp_model.dart';
import 'package:miniproject/src/pages/condo/condo_model.dart';
import 'package:miniproject/src/pages/dm/dormitory_model.dart';


class NetworkService{
  NetworkService._internal();

  static final NetworkService _instace = NetworkService._internal();

  factory NetworkService() => _instace;

  static final Dio _dio = Dio();
Future<CondoModel> getAllCondoDio() async {
  //var url = API.BASE_URL + '/flutterapp/getAllGames_7.php';
  var url = API.BASE_URL + API.CONDO;
  print('url getAllCondoDio() = ' + url);
  final response = await _dio.get(url);
  if (response.statusCode == 200) {
    print(response.data);
    return condoModelFromJson(json.encode(response.data));
  }
  throw Exception('Network failed');
}

Future<ApartmentModel> getAllApmDio() async {
  //var url = API.BASE_URL + '/flutterapp/getAllGames_7.php';
  var url = API.BASE_URL + API.APARTMENNT;
  print('url getAllApmDio() = ' + url);
  final response = await _dio.get(url);
  if (response.statusCode == 200) {
    print(response.data);
    return apartmentModelFromJson(json.encode(response.data));
  }
  throw Exception('Network failed');
}

Future<DormitorModel> getAllDmDio() async {
  //var url = API.BASE_URL + '/flutterapp/getAllGames_7.php';
  var url = API.BASE_URL + API.DORMITORY;
  print('url getAllDmDio() = ' + url);
  final response = await _dio.get(url);
  if (response.statusCode == 200) {
    print(response.data);
    return dormitorModelFromJson(json.encode(response.data));
  }
  throw Exception('Network failed');
}

} // end