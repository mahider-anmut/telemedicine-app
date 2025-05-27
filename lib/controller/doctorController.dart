import 'package:flutter/material.dart';
import 'package:telemedicine/dto/Doctor.dart';
import 'package:telemedicine/model/MedicalProfile.dart';
import 'package:telemedicine/model/Schedule.dart';
import 'package:telemedicine/model/User.dart';

import '../constants/endpoints.dart';
import '../service/api_service.dart';
import '../service/shared_preference.dart';
import '../constants/constants.dart';
import '../utils/utils.dart';
import '../utils/validators.dart';
import '../view/auth/loginPage.dart';
import '../view/homePage.dart';

class DoctorController {

  static fetchTopAvailableDoctors() async {
    var res = await Api.getAll(ApiEndpoints.getTopAvailableDoctors);

    if (res["statusCode"] == 200 || res["statusCode"] == 201) {
      List data = res["data"];
      return data.map((item) => Doctor.fromJson(item)).toList();
    }else{
      Utils.showToast("Unable to get Doctors.",type: "error");
    }
  }

  static fetchAllAvailableDoctors() async {
    var res = await Api.get(ApiEndpoints.getAvailableDoctors);

    if (res["statusCode"] == 200 || res["statusCode"] == 201) {
      List data = res["data"];
      return data.map((item) => Doctor.fromJson(item)).toList();
    }else{
      Utils.showToast("Unable to get Doctors.",type: "error");
    }
  }

  static getMedicalProfile() async {
    var userId = await SharedPreference.getString(Constants.userId);
    var res = await Api.get(ApiEndpoints.getMedicalProfile(userId));

    if (res["statusCode"] == 200 || res["statusCode"] == 201) {
      MedicalProfile medicalProfile = MedicalProfile.fromJson(res);
      return medicalProfile;
    }else{
      Utils.showToast("Unable to get Schedule.",type: "error");
    }
  }

  static updateMedicalProfile(MedicalProfile medicalProfile) async {

    var res;
    if(medicalProfile.id!=null){
      res = await Api.put(ApiEndpoints.updateMedicalProfile(medicalProfile.id!),medicalProfile.toJson());
    }else{
      res = await Api.post(ApiEndpoints.createMedicalProfile,medicalProfile.toJson());
    }

    if (res["statusCode"] == 200 || res["statusCode"] == 201) {
      Utils.showToast("Updated Successfully.");
    }else{
      Utils.showToast("Unable to update appointment.",type: "error");
    }
  }
}