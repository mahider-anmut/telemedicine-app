class ApiEndpoints {
  static const String baseUrl = 'http://172.20.10.12:5001/api';


  static const String loginEndpoint = '$baseUrl/auth/login';
  static const String userDataEndpoint = '$baseUrl/auth/me';
  static const String registerEndpoint = '$baseUrl/auth/register';
  static const String resetEndpoint = '$baseUrl/auth/forget-password-request';

  static const String createScheduleEndpoint = '$baseUrl/schedule';
  static String updateScheduleEndpoint(String id) { return "$baseUrl/schedule/$id";}
  static String updateWeeklyScheduleEndpoint(String id) { return "$baseUrl/schedule/update-weekly-schedule/$id";}
  static String updateExceptionScheduleEndpoint(String id) { return "$baseUrl/schedule/update-exception-schedule/$id";}

  static String getScheduleByDoctorIdEndpoint(String doctorId) { return "$baseUrl/schedule/user/$doctorId";}

  static String getAvailableSlotsEndpoint(String doctorId,String date) { return "$baseUrl/schedule/get-available-slot/$doctorId/$date";}

  static String createAppointmentEndpoint = '$baseUrl/appointment';
  static String getDoctorAppointmentEndpoint(String doctorId) { return "$baseUrl/appointment/doctor/$doctorId";}
  static String getPatientAppointmentEndpoint(String patientId) { return "$baseUrl/appointment/patient/$patientId";}
  static String updateAppointmentStatusEndpoint(String id) { return "$baseUrl/appointment/update-status/$id";}

  static String getAllChatByUserId(String id) { return "$baseUrl/chat/user/$id";}
  static String getAllMessageByChatId(String id) { return "$baseUrl/message/chat/$id";}

  static String createMessage = '$baseUrl/message';


  static String getAvailableDoctors = '$baseUrl/user/all-available-doctors';
  static String getTopAvailableDoctors = '$baseUrl/user/getTopAvailableDoctors';

  static const String notificationsEndpoint = '$baseUrl/notifications';
  static const String uploadEndpoint =  '$baseUrl/upload';




}