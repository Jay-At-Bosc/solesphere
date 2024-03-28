// ignore_for_file: body_might_complete_normally_nullable

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as dio;

import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solesphere/services/api/end_points.dart';
import 'package:solesphere/services/models/user_data_model.dart';

class DbAuthentication extends GetxController {
  static DbAuthentication get instance => Get.find();

  Future<bool?> createUser(UserDataModel user) async {
    try {
      // String? token = await FirebaseAuth.instance.currentUser?.getIdToken();

      // var headers = {
      //   'Content-Type': token
      // };

      Map<String, dynamic> data = {
        'UID': user.id,
        'email': user.email,
        'username': user.name,
      };
      final jsonData = jsonEncode(data);

      var diox = dio.Dio();
      var response = await diox.request(EndPoints.createUser,
          options: dio.Options(method: 'POST'), data: jsonData);

      if (response.statusCode == 201) {
        log('Success to mongo : $response');
        return true;
      } else {
        throw "User not created";
      }
    } on dio.DioException catch (_) {
      throw dio.DioException;
    } catch (e) {
      throw "Something Went Wrong";
    }
  }

  Future<bool?> createUserDetails(UserDataModel user, XFile? file) async {
    log("db method called");
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();

    var headers = {'auth-token': token};

    try {
      log("upload image method called");
      final imageUrl = await uploadImage(file);
      log("upload image method calleded : $imageUrl");

      Map<String, dynamic> data = {
        'phone': user.phone,
        'profilepic': imageUrl,
        'address': [
          {
            "house": user.house,
            "area": user.area,
            "pincode": user.pincode,
            "town": user.city,
            "state": user.state,
            "adType": user.addressType
          }
        ]
      };

      final jsonData = jsonEncode(data);
      log("api call : ${data.values}");
      var diox = dio.Dio();
      var response = await diox.request(
        EndPoints.userDetail,
        options: dio.Options(method: 'POST', headers: headers),
        data: jsonData,
      );

      if (response.statusCode == 201) {
        log('Success to mongo : $response');
        return true;
      } else {
        throw "User not created";
      }
    } on dio.DioException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw e.toString();
    }
  }

  Future<bool?> uploadImage(XFile? pickerFile) async {
    try {
      var headers = {
        'Content-Type': 'multipart/form-data',
      };
      var diox = dio.Dio();

      if (pickerFile != null) {
        var data = dio.FormData.fromMap({
          'images': [
            await dio.MultipartFile.fromFile(pickerFile.path,
                filename: pickerFile.name)
          ],
        });
       
        var response = await diox.post(
         EndPoints.userProfilePicture,
          options: dio.Options(headers: headers),
          data: data,
        );

        
        if (response.statusCode == 200) {
          log(response.data.toString());
          return response.data[0];
        } else {
          throw response.statusMessage.toString();
        }
      }
    } catch (e) {
      throw e.toString();
    }
    return null;
  }
}
