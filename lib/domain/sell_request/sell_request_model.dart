import 'package:cloud_firestore/cloud_firestore.dart';

class SellRequest {
  final String name;
  final String phone;
  final String email;
  final String location;
  final String make;
  final String model;
  final int year;
  final Timestamp datetime;
  String? userId;
  String? id;

  SellRequest({
    required this.name,
    required this.phone,
    required this.email,
    required this.location,
    required this.make,
    required this.model,
    required this.year,
    required this.datetime,
    this.userId,
    this.id,
  });

  factory SellRequest.fromJson(Map<String, dynamic> json) {
    return SellRequest(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      location: json['location'],
      make: json['make'],
      model: json['model'],
      year: json['year'],
      userId: json['userId'],
      datetime: json['datetime'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'location': location,
      'make': make,
      'model': model,
      'year': year,
      'userId': userId,
      'datetime': datetime,
      'id': id,
    };
  }
}
