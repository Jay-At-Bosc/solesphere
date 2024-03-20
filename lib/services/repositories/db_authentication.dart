import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:solesphere/services/api/end_points.dart';
import 'package:solesphere/services/models/user_data_model.dart';

class DbAuthentication extends GetxController {
  static DbAuthentication get instance => Get.find();

  Future<bool?> createUser(UserDataModel user) async {
    try {
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();

      var headers = {
        'Content-Type': token
      };
      
      Map<String, dynamic> data = {
        'UID': user.id,
        'email': user.email,
        'username': user.name,
      };
      final jsonData = jsonEncode(data);

      var dio = Dio();
      var response = await dio.request(EndPoints.createUser,options: Options(method: 'POST',headers: headers),data: jsonData);
     
      if (response.statusCode == 201) {
        log('Success to mongo : $response');
        return true;
      } else {
        throw "User not created";
      }
    } on DioException catch (_) {
      throw DioException;
    } catch (e) {
      throw "Something Went Wrong";
    }
  }
}
