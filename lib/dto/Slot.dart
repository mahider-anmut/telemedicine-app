
class Slot {
  List<String>? availableSlots;
  int? sessionDuration;
  double? sessionPrice;

  Slot({this.availableSlots, this.sessionDuration, this.sessionPrice});

  factory Slot.fromJson(Map<String, dynamic> json) {
    List<String> availableSlots = (json["availableSlots"] as List).whereType<String>().toList();
    return Slot(
      availableSlots: availableSlots,
      sessionDuration: json['sessionDuration'],
      sessionPrice: json['sessionPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'availableSlots': availableSlots,
      'sessionDuration': sessionDuration,
      'sessionPrice': sessionPrice,
    };
  }
}
