class MedicalProfile {
  final String? id;
  String? doctorId;
  int? yearsOfExperience;
  String? specialty;
  String? currentHospital;

  MedicalProfile({this.id, this.doctorId, this.yearsOfExperience, this.specialty, this.currentHospital});

  factory MedicalProfile.fromJson(Map<String, dynamic> json) {
    return MedicalProfile(
      id: json['_id'],
      doctorId: json['doctorId'],
      yearsOfExperience: json['yearsOfExperience'],
      specialty: json['specialty'],
      currentHospital: json['currentHospital'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'doctorId': doctorId,
      'yearsOfExperience': yearsOfExperience,
      'specialty': specialty,
      'currentHospital': currentHospital,
    };
  }
}
