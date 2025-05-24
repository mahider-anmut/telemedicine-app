import 'package:flutter/material.dart';
import 'package:telemedicine/model/User.dart';

import '../constants/endpoints.dart';
import '../service/api_service.dart';
import '../service/shared_preference.dart';
import '../constants/constants.dart';
import '../utils/utils.dart';
import '../utils/validators.dart';
import '../view/auth/loginPage.dart';
import '../view/homePage.dart';

class AuthController {

  static onLoginPressed(String email,String password,BuildContext context,String selectedRole) async {
    if(email.isEmpty || password.isEmpty){
      Utils.showToast("Email and Password can not be empty !",type: "error");
    }else if(Validator.isValidEmail(email)){

          Map<String, dynamic> data = {
            "email":email.trim(),
            "password": password
          };

          var res = await Api.post(ApiEndpoints.loginEndpoint,data,isAuth: false);

          if(res["statusCode"]==200 || res["statusCode"]==201){
            User user = User.fromJson(res["user"]);

            SharedPreference.setBool(Constants.isLoggedIn, true);
            SharedPreference.setString(Constants.authToken, res["token"]);

            SharedPreference.setString(Constants.userId, user.id!);
            SharedPreference.setString(Constants.firstName, user.firstName!);
            SharedPreference.setString(Constants.lastName,  user.lastName!);
            SharedPreference.setString(Constants.email, email.trim());
            SharedPreference.setString(Constants.status,  user.status!);
            SharedPreference.setString(Constants.role, user.role!);

            SharedPreference.setString(Constants.appLang,user.metaData?.preferredLang ?? "en" );

            Utils.showToast("Login Successfully !");

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
      }else{
        Utils.showToast("Incorrect Username / password !",type: "error");
      }
    }else{
      Utils.showToast("Valid Email Required !",type: "error");
    }
  }

  static onRegisterPressed(String firstName,String lastName, String email,String password,String confirm,BuildContext context) async {
    if(email.isEmpty || password.isEmpty || confirm.isEmpty){
      Utils.showToast("Email and Password can not be empty !",type: "error");
    }else if(password != confirm ){
      Utils.showToast("Passwords Does not Match !",type: "error");
    }else {
      Map<String, dynamic> data = {
        "firstName": firstName.trim(),
        "lastName": lastName.trim(),
        "email": email.trim(),
        "password": password
      };

      var res = await Api.post(
          ApiEndpoints.registerEndpoint, data, isAuth: false);

      if (res["statusCode"] == 200 || res["statusCode"] == 201) {
        User user = User.fromJson(res["user"]);

        SharedPreference.setBool(Constants.isLoggedIn, true);
        SharedPreference.setString(Constants.authToken, res["token"]);

        SharedPreference.setString(Constants.userId, user.id!);
        SharedPreference.setString(Constants.firstName, user.firstName!);
        SharedPreference.setString(Constants.lastName, user.lastName!);
        SharedPreference.setString(Constants.email, email.trim());
        SharedPreference.setString(Constants.status, user.status!);
        SharedPreference.setString(Constants.role, user.role!);

        SharedPreference.setString(
            Constants.appLang, user.metaData?.preferredLang ?? "en");

        Utils.showToast("Registration Successfully !");

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }else{
        Utils.showToast("User already exists! Please login first.",type: "error");
      }
    }
  }

  static onForgotPasswordPressed(String email,BuildContext context) async {
    if(email.isEmpty){
      Utils.showToast("Email can not be empty !",type: "error");
    }else if(Validator.isValidEmail(email)){
      Map<String, dynamic> data = {
        "email":email.trim()
      };
      var res = await Api.post(ApiEndpoints.resetEndpoint, data,isAuth: false);

      if(res["statusCode"]==200 || res["statusCode"]==201){
        Utils.showToast("Password Reset Email Sent!");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }else{
        Utils.showToast("Failed to send email. Please try again!",type: "error");
      }

    }else{
      Utils.showToast("Valid Email Required !",type: "error");
    }
  }
}