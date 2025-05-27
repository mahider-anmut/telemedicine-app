import 'User.dart';

class Appointment {
  final String? id;
  final String? patientId;
  final String? doctorId;
  final String? title;
  final double? sessionPrice;
  final int? sessionDuration;
  final String? sessionTime;
  final String? appointmentDate;
  final String? appointmentTime;
  final String? appointmentStatus;
  final User? patient;
  final User? doctor;

  Appointment({this.id, this.patientId, this.doctorId, this.title, this.sessionPrice, this.sessionDuration, this.sessionTime, this.appointmentDate, this.appointmentStatus, this.appointmentTime, this.doctor,this.patient});

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['_id'],
      patientId: json['patientId'],
      doctorId: json['doctorId'],
      title: json['title'],
      sessionPrice: json['sessionPrice']?.toDouble(),
      sessionDuration: json['sessionDuration'],
      sessionTime: json['sessionTime'],
      appointmentDate: json['appointmentDate'],
      appointmentTime: json['appointmentTime'],
      appointmentStatus: json['appointmentStatus'],
      patient: json['_patient'] != null? User.fromJson(json['_patient']): null,
      doctor: json['_doctor'] != null? User.fromJson(json['_doctor']): null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'patientId': patientId,
      'doctorId': doctorId,
      'title': title,
      'sessionPrice': sessionPrice,
      'sessionDuration': sessionDuration,
      'sessionTime': sessionTime,
      'appointmentDate': appointmentDate,
      'appointmentTime': appointmentTime,
      'appointmentStatus': appointmentStatus,
      'patient': patient,
      'doctor': doctor
    };
  }
}
