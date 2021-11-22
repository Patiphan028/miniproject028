import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:project/src/configs/api.dart';
import 'package:project/src/pages/model/amp_model.dart';
import 'package:project/src/pages/model/condo_model.dart';
import 'package:project/src/pages/model/dormitory_model.dart';
import 'package:project/src/pages/model/game_model.dart';

class NetworkService {
  NetworkService._internal();

  static final NetworkService _instace = NetworkService._internal();

  factory NetworkService() => _instace;

  static final Dio _dio = Dio();


  Future<String> validateUserLoginDio(String username, String password) async {
    FormData data = FormData.fromMap({
      'username': username,
      'password': password,
    });
    try {
      //var url = API.BASE_URL + '/flutterapp/f_user_login.php';
      //var url = API.BASE_URL + '/api/user';
      var url = API.BASE_URL + '/flutterapi/api/user';
      final response = await _dio.post(url, data: data);
      if (response.statusCode == 200) {
        var jsonString = response.data;
        // var jsonMap = json.encode(jsonString);
        String username = jsonString["username"];
        print('username = ' + username);
        String password = jsonString["password"];
        print('password = ' + password);
        if (username != 'failed') {
          return 'pass';
        } else {
          return 'failed';
        }
      } else {
        return 'failed';
      }
    } catch (Exception) {
      throw Exception('Network failed');
    }
  }



  Future<String> addGameDio(File imageFile, Game game) async {
    FormData data = FormData.fromMap({
      'game_id': game.gameId,
      'game_name': game.gameName,
      'game_price': int.parse(game.gamePrice),
      'game_detail': game.gameDetail,
      //'game_img': game.gameImg,
      'game_stock': int.parse(game.gameStock),
      if (imageFile != null)
        'game_img': 'has_image'
      else
        'game_img': 'no_image',
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });
    try {
      final response = await _dio.post(API.BASE_URL + API.GAME_URL, data: data);
      print(response);
      if (response != null) {
        if (response.statusCode == 200) {
          print(response.data);
          if (response.data > 0) {
            return 'Add Successfully';
          } else {
            return 'Add Failed';
          }
        }
      } else {
        print('response is nulllllll');
      }
    } catch (DioError) {
      print('Exception --> response is nulllllll');
      print(DioError.toString());
      throw DioError();
    }
  }

  Future<String> editGameDio(File imageFile, Game game) async {
    FormData data = FormData.fromMap({
      'game_name': game.gameName,
      'game_price': game.gamePrice,
      'game_detail': game.gameDetail,
      'game_img': game.gameImg,
      'game_stock': game.gameStock,
      // if (imageFile != null)
      //   'photo': await MultipartFile.fromFile(
      //     imageFile.path,
      //     contentType: MediaType('image', 'jpg'),
      //   ),
      if (imageFile != null)
        'game_img': game.gameImg
      else
        'game_img': 'no_image',
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });

    final response =
    await _dio.post(API.BASE_URL + API.GAME_URL + '/' + game.id, data: data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.data);
      if (response.data > 0) {
        return 'Edit Successfully';
      } else {
        return 'Edit Failed';
      }
    }
    throw Exception('Network failed');
  }

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
    var url = API.BASE_URL + API.APARTMENT;
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
