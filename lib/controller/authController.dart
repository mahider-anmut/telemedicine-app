// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants/endpoints.dart';
import '../service/api_service.dart';
// import '../service/firebase_auth.dart';
import '../service/shared_preference.dart';
import '../constants/constants.dart';
import '../utils/utils.dart';
import '../utils/validators.dart';
import '../view/auth/loginPage.dart';
// import '../view/auth/onboardingPage.dart';
import '../view/auth/pending.dart';
import '../view/homePage.dart';

class AuthController {
  static onLoginPressed(String email,String password,BuildContext context,String selectedRole) async {

    // if(Validator.isValidEmail(email)){
    //   User? user = await FirebaseAuthService.loginWithEmailAndPassword(email.trim(), password.trim());
    //
    //   if(user!=null){
    //     var firebaseToken = await user.getIdToken();
    //     if(!user.emailVerified){
    //       Utils.showToast("Email not verified, please verify your Email first !",type: "info");
    //     }else{
    //       Map<String, dynamic> data = {
    //         "email":email.trim(),
    //         "firebaseToken": firebaseToken,
    //         "role": selectedRole
    //       };
    //
    //       var res = await Api.post(ApiEndpoints.loginEndpoint,data,isAuth: false);
    //
    //       if (res["reason"] == "you have to register first") {
    //         SharedPreference.setString(Constants.firebaseToken, firebaseToken!);
    //         Navigator.pushReplacement(
    //           context,
    //           MaterialPageRoute(
    //               builder: (context) => const OnboardingPage()),
    //         );
    //       } else {
    //         var authToken = res["token"];
    //         var user = res["user"];
    //
    //         SharedPreference.setBool(Constants.isLoggedIn, true);
    //         SharedPreference.setString(Constants.authToken, authToken);
    //
    //         SharedPreference.setString(Constants.firstName, user["firstName"]);
    //         SharedPreference.setString(Constants.lastName, user["lastName"]);
    //         SharedPreference.setString(Constants.companyName, user["companyName"]);
    //         SharedPreference.setString(Constants.email, email.trim());
    //         SharedPreference.setBool(Constants.approved, user["approved"]);
    //         SharedPreference.setBool(Constants.requestingApproval, user["requestingApproval"]);
    //         SharedPreference.setBool(Constants.banned, user["banned"]);
    //         SharedPreference.setInt(Constants.rating, user["rating"]);
    //         SharedPreference.setString(Constants.role, user["role"]);
    //
    //         //SharedPreference.setString(Constants.appLang,"en");
    //
    //         Utils.showToast("Login Successfully !");
    //
    //         if (user["requestingApproval"] == true) {
    //           Navigator.pushReplacement(
    //             context,
    //             MaterialPageRoute(
    //                 builder: (context) => const AccountApprovalPendingPage()),
    //           );
    //         } else {
    //           Navigator.pushReplacement(
    //             context,
    //             MaterialPageRoute(builder: (context) => HomePage()),
    //           );
    //         }
    //       }
    //             }
    //   }else{
    //     Utils.showToast("Incorrect Username / password !",type: "error");
    //   }
    // }else{
    //   Utils.showToast("Valid Email Required !",type: "error");
    // }
  }

  static onRegisterPressed(String email,String password,String confirm,BuildContext context) async {
    // if(password != confirm ){
    //   //show error
    // }else{
    //   User? user = await FirebaseAuthService.registerWithEmailAndPassword(email.trim(), password.trim());
    //
    //   if(user!=null){
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(builder: (context) => const LoginPage()),
    //     );
    //   }
    // }

  }

  // static onForgotPasswordPressed(String email,BuildContext context) async {
  //   if(Validator.isValidEmail(email)){
  //     await FirebaseAuthService.resetPassword(email.trim());
  //     Utils.showToast("Password Reset Email Sent!");
  //   }else{
  //     Utils.showToast("Valid Email Required !",type: "error");
  //   }
  // }

  static Future<void> onBordingPressed(BuildContext context, String firstName, String lastName, String companyName, String tinNumber, String phoneNumber,String selectedRole) async {

    String firebaseToken = await SharedPreference.getString(Constants.authToken);


    Map<String, dynamic> data = {
      "firebaseToken": firebaseToken,
      "role": selectedRole,
      "firstName": firstName,
      "lastName": lastName,
      "companyName": companyName,
      "tinNumber": tinNumber,
      "phoneNumber": phoneNumber,
    };

    var res =  await Api.post(ApiEndpoints.onbordingEndpoint,data);

    if(res["success"]==true){

      var authToken = res["token"];
      var user = res["user"];

      SharedPreference.setBool(Constants.isLoggedIn, true);
      SharedPreference.setString(Constants.authToken, authToken);

      SharedPreference.setString(Constants.firstName, user["firstName"]);
      SharedPreference.setString(Constants.lastName, user["lastName"]);
      SharedPreference.setBool(Constants.approved, user["approved"]);
      SharedPreference.setString(Constants.role, user["role"]);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AccountApprovalPendingPage()),
      );
    }
  }

  static getUserdata(BuildContext context) async {
    var firebaseToken = SharedPreference.getString(Constants.authToken);

    Map<String, dynamic> data = {
      "firebaseToken": firebaseToken,
    };
    var res =  await Api.get(ApiEndpoints.userDataEndpoint,);

  }

}