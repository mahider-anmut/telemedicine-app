class Schedule {
  final String? id;
  final String? doctorId;
  WeeklySchedule? weeklySchedule;
  List<ExceptionSlot>? exceptions;
  final int? sessionDuration;
  final double? sessionPrice;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Schedule({
    this.id,
    this.doctorId,
    this.weeklySchedule,
    this.exceptions,
    this.sessionDuration,
    this.sessionPrice,
    this.createdAt,
    this.updatedAt,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      id: json['_id'],
      doctorId: json['doctorId'],
      weeklySchedule: json['weeklySchedule'] != null
          ? WeeklySchedule.fromJson(json['weeklySchedule'])
          : null,
      exceptions: json['exceptions'] != null
          ? List<ExceptionSlot>.from(
          json['exceptions'].map((e) => ExceptionSlot.fromJson(e)))
          : [],
      sessionDuration: json['sessionDuration'],
      sessionPrice: json['sessionPrice']?.toDouble(),
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'doctorId': doctorId,
      'weeklySchedule': weeklySchedule?.toJson(),
      'exceptions': exceptions?.map((e) => e.toJson()).toList(),
      'sessionDuration': sessionDuration,
      'sessionPrice': sessionPrice,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

class WeeklySchedule {
  final List<String>? monday;
  final List<String>? tuesday;
  final List<String>? wednesday;
  final List<String>? thursday;
  final List<String>? friday;
  final List<String>? saturday;
  final List<String>? sunday;

  WeeklySchedule({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  });

  factory WeeklySchedule.fromJson(Map<String, dynamic> json) {
    return WeeklySchedule(
      monday: List<String>.from(json['monday'] ?? []),
      tuesday: List<String>.from(json['tuesday'] ?? []),
      wednesday: List<String>.from(json['wednesday'] ?? []),
      thursday: List<String>.from(json['thursday'] ?? []),
      friday: List<String>.from(json['friday'] ?? []),
      saturday: List<String>.from(json['saturday'] ?? []),
      sunday: List<String>.from(json['sunday'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'monday': monday ?? [],
      'tuesday': tuesday ?? [],
      'wednesday': wednesday ?? [],
      'thursday': thursday ?? [],
      'friday': friday ?? [],
      'saturday': saturday ?? [],
      'sunday': sunday ?? [],
    };
  }
}

class ExceptionSlot {
  final DateTime? date;
  final List<String>? timeSlots;

  ExceptionSlot({
    this.date,
    this.timeSlots,
  });

  factory ExceptionSlot.fromJson(Map<String, dynamic> json) {
    return ExceptionSlot(
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      timeSlots: List<String>.from(json['timeSlots'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date?.toIso8601String(),
      'timeSlots': timeSlots ?? [],
    };
  }
}
