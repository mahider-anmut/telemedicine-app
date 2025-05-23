import 'dart:collection';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../constants/endpoints.dart';
import '../utils/utils.dart';
import 'shared_preference.dart';


class Api {

  static Map<String, dynamic> _processResponse(http.Response response) {
    try {
      final body = response.body.trim();
      final decodedData = body.isNotEmpty ? json.decode(body) : null;

      return {
        "statusCode": response.statusCode,
        ...decodedData,
      };
    } catch (e) {
      throw Exception('Failed to decode response: ${e.toString()}');
    }
  }

  // static Future<bool> _processTokenRefresh() async {
  //
  //   String? firebaseToken = await FirebaseAuthService.refreshToken();
  //   String selectedRole = await SharedPreference.getString(Constants.role);
  //   String email = await SharedPreference.getString(Constants.email);
  //
  //   Map<String, dynamic> data = {
  //     "email": email,
  //     "firebaseToken": firebaseToken,
  //     "role": selectedRole
  //   };
  //
  //   var res = await Api.post(ApiEndpoints.loginEndpoint,data,isAuth: false);
  //
  //   if(res["statusCode"]==422){
  //     SharedPreference.setBool(Constants.isLoggedIn,false);
  //   }else{
  //     var authToken = res["token"];
  //     await SharedPreference.setString(Constants.authToken, authToken);
  //     await SharedPreference.setString(Constants.firebaseToken, firebaseToken!);
  //   }
  //
  //   return true;
  // }

  static Future<Map<String, dynamic>> get(String endpoint, {Map<String, dynamic>? filters,Map<String, dynamic>? body, bool isAuth = true, bool refreshed = false}) async {
    final Uri uri = Uri.parse(endpoint);
    final Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json',
    };

    // Check for internet connection
    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult==ConnectivityResult.none) {
      Utils.showToast("No Internet Connection,Please try again.", type: "alert");
      //throw Exception('No internet connection');
    }

    // Add Authorization header if needed
    if (isAuth) {
      headers['Authorization'] = "Bearer ${await SharedPreference.getString(Constants.authToken)}";
    }

    try {
      final http.Response response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        return _processResponse(response);
      } else {
        // Handle other status codes
        return _processResponse(response);
      }
    } catch (e) {
      // Handle any errors
      // showToast("Unable to Connect to Server", type: "error");
      throw Exception('Unable to Connect to Server: $e');
    }
  }

  static Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> body,  {bool isAuth = true,refreshed = false}) async {
    final Uri uri = Uri.parse(endpoint);
    final String jsonBody = json.encode(body);

    final Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json',
    };

    // Check for internet connection
    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult ==ConnectivityResult.none) {
      Utils.showToast("No Internet Connection,Please try again.", type: "alert");
      //throw Exception('No internet connection');
    }

    // Add Authorization header if needed
    if (isAuth) {
      headers['Authorization'] = "Bearer ${await SharedPreference.getString(Constants.authToken)}";
    }

    try {
      final http.Response response = await http.post(uri, headers: headers, body: jsonBody);

      if (response.statusCode == 200) {
        return _processResponse(response);
      } else {
        return _processResponse(response);
      }
    } catch (e) {
      throw Exception('Unable to Connect to Server $e');
    }
  }

  static Future<Map<String, dynamic>> uploadFile(String filePath) async {
    final Uri uri = Uri.parse(ApiEndpoints.uploadEndpoint);
    final request = http.MultipartRequest('POST', uri);

    Map<String, String> fields = const {'upload_preset': 'orcas-test-lpr10ytt'};

    // Add fields to the request
    request.fields.addAll(fields);

    // Add file to the request
    request.files.add(await http.MultipartFile.fromPath('file', filePath));

    try {
      // Send the request and get the response
      final http.StreamedResponse streamedResponse = await request.send();
      final http.Response response = await http.Response.fromStream(streamedResponse);

      // Parse and return the JSON response
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        jsonResponse["statusCode"] = response.statusCode;
        return jsonResponse;
      } else {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        jsonResponse["statusCode"] = response.statusCode;
        return jsonResponse;
      }
    } catch (e) {
      throw Exception('Unable to connect to server: $e');
    }
  }


  // static Future<ExampleModel?> put({required Map<String, dynamic> body, required String endpoint, bool isAuth = true}) async {
  //   final Uri uri = Uri.parse(BASE_URL + endpoint);
  //   final String jsonString = json.encode(body);
  //
  //   final Map<String, String> headers = <String, String>{
  //     'Content-Type': 'application/json'
  //   };
  //   if (isAuth) {
  //     headers['Authorization'] = await SharedPreference.getString("auth");
  //   }
  //
  //   final http.Response response = await http.put(uri, headers: headers, body: jsonString);
  //
  //   try {
  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> jsonResponse = json.decode(response.body);
  //       return ExampleModel.fromJson(jsonResponse);
  //     } else {
  //       throw Exception('Unable to update $endpoint from API with code ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     throw Exception('Unable to Connect to Server $e');
  //   }
  // }
  //
  // static Future<void> delete(String endpoint, {bool isAuth = true}) async {
  //   final Uri uri = Uri.parse(BASE_URL + endpoint);
  //   final Map<String, String> headers = <String, String>{
  //     'Content-Type': 'application/json',
  //   };
  //   if (isAuth) {
  //     headers['Authorization'] = await SharedPreference.getString("auth");
  //   }
  //
  //   final http.Response response = await http.delete(uri, headers: headers);
  //
  //   try {
  //     if (response.statusCode != 204) {
  //       throw Exception('Unable to delete $endpoint from API with code ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     throw Exception('Unable to Connect to Server $e');
  //   }
  // }

}
