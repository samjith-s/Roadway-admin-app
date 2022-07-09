class Segment {
  final bool isCar;
  final String segmentName;
  final String? segmentId;
  Segment({required this.segmentName, required this.isCar, this.segmentId});

  Map<String, dynamic> toJson() {
    return {
      'isCar': isCar,
      'segmentName': segmentName,
      'segmentId': segmentId,
    };
  }

  factory Segment.fromJson(Map<String, dynamic> json) {
    return Segment(
      segmentName: json['segmentName'],
      isCar: json['isCar'],
      segmentId: json['segmentId'],
    );
  }
}
