class MetaModel {
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  MetaModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    barcode = json['barcode'];
    qrCode = json['qrCode'];
  }
}
