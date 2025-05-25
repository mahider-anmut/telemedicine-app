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

  static getAllAppointment() async {
    var userRole = await SharedPreference.getString(Constants.role);
    var userId = await SharedPreference.getString(Constants.userId);

    var res;
    if(userRole==Constants.patientRole){
      res = await Api.getAll(ApiEndpoints.getDoctorAppointmentEndpoint(userId));
    }else{
      res = await Api.getAll(ApiEndpoints.getPatientAppointmentEndpoint(userId));
    }

    List<Appointment> appointments = (res["data"] as List)
        .map((json) => Appointment.fromJson(json))
        .toList();

    return appointments;
  }

  static updateStatus(BuildContext context,String id,String status) async {


    Map<String, dynamic> data = {
      "appointmentStatus": status,
    };

    var res = await Api.put(ApiEndpoints.updateAppointmentStatusEndpoint(id),data);

    if (res["statusCode"] == 200 || res["statusCode"] == 201) {
      Utils.showToast("Updated Successfully.");
    }else{
      Utils.showToast("Unable to update appointment.",type: "error");
    }
  }
}