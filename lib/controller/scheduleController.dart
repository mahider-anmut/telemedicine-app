import 'package:flutter/material.dart';
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

class ScheduleController {

  static fetchSchedule() async {
    var userId = await SharedPreference.getString(Constants.userId);
    var res = await Api.get(ApiEndpoints.getScheduleByDoctorIdEndpoint(userId));

    if (res["statusCode"] == 200 || res["statusCode"] == 201) {
      Schedule schedule = Schedule.fromJson(res);
      return schedule;
    }else{
      Utils.showToast("Unable to get Schedule.",type: "error");
    }
  }

  static updateSetup(BuildContext context ,String? id, int duration,double price) async {

      Map<String, dynamic> data = {
        "sessionDuration": duration,
        "sessionPrice": price,
        "doctorId": await SharedPreference.getString(Constants.userId)
      };

      var res;
      if(id != null){
        res = await Api.put(ApiEndpoints.updateScheduleEndpoint(id), data);
      }else{
        res = await Api.post(ApiEndpoints.createScheduleEndpoint, data);
      }

      if (res["statusCode"] == 200 || res["statusCode"] == 201) {
        Schedule schedule = Schedule.fromJson(res);
        Utils.showSnackBar(context,"Schedule Updated !");
        return schedule;
      }else{
        Utils.showToast("Unable to update Schedule.",type: "error");
      }

  }

  static updateWeeklySchedule(BuildContext context ,String id,WeeklySchedule weeklySchedule) async {

    Map<String, dynamic> data = {
      "weeklySchedule": weeklySchedule.toJson()
    };

    var res = await Api.put(ApiEndpoints.updateWeeklyScheduleEndpoint(id), data);


    if (res["statusCode"] == 200 || res["statusCode"] == 201) {
      Schedule schedule = Schedule.fromJson(res);
      Utils.showSnackBar(context,"Schedule Updated !");
      return schedule;
    }else{
      Utils.showToast("Unable to update Schedule.",type: "error");
    }

  }

  static updateExceptionSchedule(BuildContext context ,String id,List<ExceptionSlot> exceptions) async {

    Map<String, dynamic> data = {
      "exceptions": exceptions.map((e) => e.toJson()).toList(),
    };

    var res = await Api.put(ApiEndpoints.updateExceptionScheduleEndpoint(id), data);


    if (res["statusCode"] == 200 || res["statusCode"] == 201) {
      Schedule schedule = Schedule.fromJson(res);
      Utils.showSnackBar(context,"Schedule Updated !");
      return schedule;
    }else{
      Utils.showToast("Unable to update Schedule.",type: "error");
    }

  }

}