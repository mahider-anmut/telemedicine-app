import 'dart:io';

import 'package:flutter/material.dart';
import 'package:telemedicine/dto/Doctor.dart';
import 'package:telemedicine/model/Appointment.dart';
import 'package:telemedicine/model/Chat.dart';
import 'package:telemedicine/model/Message.dart';
import 'package:telemedicine/model/Schedule.dart';
import 'package:telemedicine/model/User.dart';

import '../constants/endpoints.dart';
import '../service/api_service.dart';
import '../service/shared_preference.dart';
import '../constants/constants.dart';
import '../utils/utils.dart';
import '../utils/validators.dart';
import '../view/auth/loginPage.dart';
import '../view/consultations/videoCall2.dart';
import '../view/homePage.dart';

class ChatController {

  static getChats() async {
    var userId = await SharedPreference.getString(Constants.userId);

    var res = await Api.getAll(ApiEndpoints.getAllChatByUserId(userId));

    List<Chat> chats = (res["data"] as List)
        .map((json) => Chat.fromJson(json))
        .toList();

    return chats;
  }

  static getAllMessageByChatId(String chatId) async {
    var res = await Api.getAll(ApiEndpoints.getAllMessageByChatId(chatId));

    List<Message> chats = (res["data"] as List)
        .map((json) => Message.fromJson(json))
        .toList();

    return chats;
  }

  static sendMessage(Message msg) async {
    var res = await Api.post(ApiEndpoints.createMessage,msg.toJson());

    if (res["statusCode"] == 200 || res["statusCode"] == 201) {
      Message msg = Message.fromJson(res);
      return msg;
    }else{
      Utils.showToast("Unable to get Schedule.",type: "error");
    }
  }

  static uploadFile (File file) async {
    var res = await Api.uploadFile(file.path);
    return res["url"];
  }

  static initVideoCall (BuildContext context ,String appointmentId) async {

    var res = await Api.get(ApiEndpoints.initVideoCall(appointmentId));

    if (res["statusCode"] == 200 || res["statusCode"] == 201) {
      String url = res["callUrl"];
      // String fullUrl = "$url?redirect_on_leave=${Uri.encodeComponent("https://google.com")}";
      await Navigator.of(context).push(MaterialPageRoute(
        // builder: (_) => VideoCallPage(
        //   checkoutUrl: fullUrl,
        //   successUrl: 'https://google.com',
        // ),
          builder: (_) => VideoCallPage(url: url),

      ));
    }else{
      Utils.showToast("Unable to navigate to payment url.",type: "error");
    }
  }

}