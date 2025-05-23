class ApiEndpoints {
  static const String baseUrl = 'http://172.20.10.12:5001/api';


  static const String loginEndpoint = '$baseUrl/auth/login';
  static const String userDataEndpoint = '$baseUrl/auth/me';
  static const String registerEndpoint = '$baseUrl/auth/register';
  static const String resetEndpoint = '$baseUrl/auth/forget-password-request';

  static const String notificationsEndpoint = '$baseUrl/notifications';
  static const String uploadEndpoint =  '$baseUrl/upload';




}