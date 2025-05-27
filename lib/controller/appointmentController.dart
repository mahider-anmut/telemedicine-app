import 'package:flutter/material.dart';
import 'package:telemedicine/dto/Doctor.dart';
import 'package:telemedicine/model/Appointment.dart';
import 'package:telemedicine/model/Schedule.dart';
import 'package:telemedicine/model/User.dart';
import 'package:uuid/uuid.dart';

import '../constants/endpoints.dart';
import '../service/api_service.dart';
import '../service/shared_preference.dart';
import '../constants/constants.dart';
import '../utils/utils.dart';
import '../utils/validators.dart';
import '../view/appointments/checkout.dart';
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
      res = await Api.getAll(ApiEndpoints.getPatientAppointmentEndpoint(userId));
    }else{
      res = await Api.getAll(ApiEndpoints.getDoctorAppointmentEndpoint(userId));
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

  static initPayment (BuildContext context, String price,String appointmentId) async {
    final uuid = Uuid();
    var firstName = await SharedPreference.getString(Constants.firstName);
    var lastName = await SharedPreference.getString(Constants.lastName);
    var email = await SharedPreference.getString(Constants.email);
    var txnId = uuid.v4();

    Map<String, dynamic> data = {
      "price":price,
      "firstName":firstName,
      "lastName":lastName,
      "email":email,
      "phone":"0900123456",
      "transactionId":txnId,
      "appointmentId":appointmentId,
      "paymentType":"chapa"
    };
    var res = await Api.post(ApiEndpoints.initPayment,data);

    if (res["statusCode"] == 200 || res["statusCode"] == 201) {
      String url = res["data"]["checkout_url"];
      await Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => CheckoutPage(
          checkoutUrl: url,
          successUrl: 'https://google.com',
        ),
      ));
    }else{
      Utils.showToast("Unable to navigate to payment url.",type: "error");
    }
  }

}