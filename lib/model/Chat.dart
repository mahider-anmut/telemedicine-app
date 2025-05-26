import 'User.dart';

class Chat {
  final String? id;
  final String? doctorId;
  final String? patientId;
  final String? status;
  final int? unreadCount;
  final String? lastMessage;
  final DateTime? lastMessageTimestamp;
  final User? patient;
  final User? doctor;


  Chat({this.id, this.doctorId, this.patientId, this.status,this.unreadCount=0,this.lastMessage,this.patient,this.doctor,this.lastMessageTimestamp});

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json['_id'],
      doctorId: json['doctorId'],
      patientId: json['patientId'],
      status: json['status'],
      unreadCount: json['unreadCount'] ?? 0,
      lastMessage: json['lastMessage'],
      patient: json['_patient'] != null? User.fromJson(json['_patient']): null,
      doctor: json['_doctor'] != null? User.fromJson(json['_doctor']): null,
      lastMessageTimestamp: DateTime.parse(json['updatedAt'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'doctorId': doctorId,
      'patientId': patientId,
      'status': status,
      'unreadCount': unreadCount,
      'lastMessage': lastMessage,
      'patient': patient,
      'doctor': doctor,
      'lastMessageTimestamp':lastMessageTimestamp
    };
  }
}
