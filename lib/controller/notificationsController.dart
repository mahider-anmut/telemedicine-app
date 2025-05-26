import '../constants/constants.dart';
import '../constants/endpoints.dart';
import '../model/Notification.dart';
import '../service/api_service.dart';
import '../service/shared_preference.dart';

class NotificationsController {
  static loadNotifications() async {
    var userId = await SharedPreference.getString(Constants.userId);
     var res =  await Api.getAll(ApiEndpoints.notificationsEndpoint(userId));

     List<Notification> notifications = (res["data"] as List)
         .map((json) => Notification.fromJson(json))
         .toList();

     return notifications;
  }
}