class Statistics {
  final String? doctorId;
  final double? avgRating;
  final int? totalReviews;
  final int? totalSessions;
  final double? totalEarnings;
  final int? totalPatients;
  final List<Review>? reviews;

  Statistics({
    this.doctorId,
    this.avgRating,
    this.totalReviews,
    this.totalSessions,
    this.totalEarnings,
    this.totalPatients,
    this.reviews,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      doctorId: json['doctorId'],
      avgRating: (json['avgRating'] as num?)?.toDouble(),
      totalReviews: json['totalReviews'],
      totalSessions: json['totalSessions'],
      totalEarnings: (json['totalEarnings'] as num?)?.toDouble(),
      totalPatients: json['totalPatients'],
      reviews: json['reviews'] != null
          ? List<Review>.from(json['reviews'].map((r) => Review.fromJson(r)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doctorId': doctorId,
      'avgRating': avgRating,
      'totalReviews': totalReviews,
      'totalSessions': totalSessions,
      'totalEarnings': totalEarnings,
      'totalPatients': totalPatients,
      'reviews': reviews?.map((r) => r.toJson()).toList(),
    };
  }
}

class Review {
  final String? userId;
  final double? rating;
  final String? review;

  Review({this.userId, this.rating, this.review});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      userId: json['userId'],
      rating: (json['rating'] as num?)?.toDouble(),
      review: json['review'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'rating': rating,
      'review': review,
    };
  }
}
