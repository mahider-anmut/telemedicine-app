class Appointment {
  final String? id;
  final String? patientId;
  final String? doctorId;
  final String? title;
  final String? sessionPrice;
  final String? sessionDuration;
  final String? sessionTime;
  final String? appointmentDate;
  final String? appointmentTime;
  final String? appointmentStatus;

  Appointment({this.id, this.patientId, this.doctorId, this.title, this.sessionPrice, this.sessionDuration, this.sessionTime, this.appointmentDate, this.appointmentStatus, this.appointmentTime});

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['_id'],
      patientId: json['patientId'],
      doctorId: json['doctorId'],
      title: json['title'],
      sessionPrice: json['sessionPrice'],
      sessionDuration: json['sessionDuration'],
      sessionTime: json['sessionTime'],
      appointmentDate: json['appointmentDate'],
      appointmentTime: json['appointmentTime'],
      appointmentStatus: json['appointmentStatus']
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
    };
  }
}
