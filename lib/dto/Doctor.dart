import 'package:telemedicine/model/MedicalProfile.dart';

import '../model/Statistics.dart';
import '../model/User.dart';

class Doctor {
  User? userInfo;
  Statistics? statistics;
  MedicalProfile? medicalProfile;

  Doctor({this.userInfo, this.statistics, this.medicalProfile});

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      userInfo: User.fromJson(json),
      statistics: json['_statistics'] != null ? Statistics.fromJson(json['_statistics']) : null,
      medicalProfile: json['_medicalProfile'] != null ? MedicalProfile.fromJson(json['_medicalProfile']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userInfo': userInfo?.toJson(),
      'statistics': statistics?.toJson(),
      'medicalProfile': medicalProfile?.toJson(),
    };
  }
}
