class DimensionsModel {
  double? width;
  double? height;
  double? depth;

  DimensionsModel.fromJson(Map<String, dynamic> json) {
    width = (json['width'] as num).toDouble();
    height = (json['height'] as num).toDouble();
    depth = (json['depth'] as num).toDouble();
  }
}
