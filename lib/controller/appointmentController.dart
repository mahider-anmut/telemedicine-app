import 'package:flutter/material.dart';
import 'package:telemedicine/dto/Doctor.dart';
import 'package:telemedicine/model/Appointment.dart';
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

class AppointmentController {

  static createAppointment(BuildContext context, Appointment appointment) async {
    var res = await Api.post(ApiEndpoints.createAppointmentEndpoint,appointment.toJson());

    if (res["statusCode"] == 200 || res["statusCode"] == 201) {
      Utils.showToast("Appointment created Successfully.");
      Navigator.pop(context);
    }else{
      Utils.showToast("Unable to create appointment.",type: "error");
    }
  }

}