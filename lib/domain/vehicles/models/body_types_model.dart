class BodyType {
  final bool isCar;
  final String type;
  final String? id;

  BodyType({required this.type, required this.isCar, this.id});

  Map<String, dynamic> toJson() {
    return {
      "isCar": isCar,
      "type": type,
      "id": id,
    };
  }

  factory BodyType.fromJson(Map<String, dynamic> json) {
    return BodyType(
      type: json["type"],
      isCar: json['isCar'],
      id: json['id'],
    );
  }
}
