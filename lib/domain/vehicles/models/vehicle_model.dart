class Vehicle {
  final List<dynamic> images;
  final String type;
  final String brand;
  final String model;
  final String segment;
  final String bodyType;
  final double price;
  final String manufactureYear;
  final String registrationYear;
  final String fuelType;
  final String color;
  final String ownerCount;
  final String mileage;
  final String kilometers;
  final String regPlace;
  final String? id;

  Vehicle({
    required this.images,
    required this.type,
    required this.brand,
    required this.model,
    required this.segment,
    required this.bodyType,
    required this.price,
    required this.manufactureYear,
    required this.registrationYear,
    required this.fuelType,
    required this.color,
    required this.ownerCount,
    required this.mileage,
    required this.kilometers,
    required this.regPlace,
    this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'images': images,
      'type': type,
      'brand': brand,
      'model': model,
      'segment': segment,
      'bodyType': bodyType,
      'price': price,
      'manufactureYear': manufactureYear,
      'registrationYear': registrationYear,
      'fuelType': fuelType,
      'color': color,
      'ownerCount': ownerCount,
      'mileage': mileage,
      'kilometers': kilometers,
      'regPlace': regPlace,
      'id': id,
    };
  }

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      images: json['images'],
      type: json['type'],
      brand: json['brand'],
      model: json['model'],
      segment: json['segment'],
      bodyType: json['bodyType'],
      price: double.tryParse(json['price'].toString()) ?? 0,
      manufactureYear: json['manufactureYear'],
      registrationYear: json['registrationYear'],
      fuelType: json['fuelType'],
      color: json['color'],
      ownerCount: json['ownerCount'],
      mileage: json['mileage'],
      kilometers: json['kilometers'],
      regPlace: json['regPlace'],
      id: json['id'],
    );
  }
}
