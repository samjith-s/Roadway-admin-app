class Brand {
  final String imagePath;
  final String name;
  final String? brandId;

  Brand({
    required this.imagePath,
    required this.name,
    this.brandId,
  });

  Map<String, dynamic> toJson() {
    return {
      'imagePath': imagePath,
      'name': name,
      'brandId': brandId,
    };
  }

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      imagePath: json['imagePath'],
      name: json['name'],
      brandId: json['brandId'],
    );
  }
}
