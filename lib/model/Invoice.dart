class Invoice {
  final String? id;
  final String? appointmentId;
  final String? price;
  final String? status;
  final String? paymentType;

  Invoice({this.id, this.appointmentId, this.price, this.status, this.paymentType});

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      id: json['_id'],
      appointmentId: json['appointmentId'],
      price: json['price'],
      status: json['status'],
      paymentType: json['paymentType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'appointmentId': appointmentId,
      'price': price,
      'status': status,
      'paymentType': paymentType,
    };
  }
}
