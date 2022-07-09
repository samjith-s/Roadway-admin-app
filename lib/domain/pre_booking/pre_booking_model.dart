import 'package:cloud_firestore/cloud_firestore.dart';

class PreBooking {
  final String name;
  final String phone;
  final String email;
  final Budget? budget;
  final String make;
  final String model;
  final int? year;
  final Timestamp datetime;
  String? userId;
  String? id;

  PreBooking({
    required this.budget,
    required this.name,
    required this.phone,
    required this.email,
    required this.make,
    required this.model,
    required this.year,
    required this.datetime,
    this.userId,
    this.id,
  });

  factory PreBooking.fromJson(Map<String, dynamic> json) {
    return PreBooking(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      budget: json['budget'] != null ? Budget.fromJson(json['budget']) : null,
      make: json['make'],
      model: json['model'],
      year: json['year'],
      userId: json['userId'],
      datetime: json['datetime'],
      id: json['id'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'name': name,
  //     'phone': phone,
  //     'email': email,
  //     'make': make,
  //     'model': model,
  //     'year': year,
  //     'userId': userId,
  //     'datetime': datetime,
  //     'budget': budget != null ? budget!.toJson() : null,
  //     'id': id,
  //   };
  // }
}

class Budget {
  final int start;
  final int end;

  const Budget({
    required this.start,
    required this.end,
  });

  factory Budget.fromJson(Map<String, dynamic> json) {
    return Budget(start: json['start'], end: json['end']);
  }

  // Map<String, dynamic> toJson() => {
  //       'start': start,
  //       'end': end,
  //     };
}
