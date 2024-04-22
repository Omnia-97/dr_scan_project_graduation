class MedicalTestModel {
  MedicalTestModel({
    this.imageUrl,
    this.prediction,
  });
  final String? imageUrl;
  final String? prediction;

  MedicalTestModel.fromJson(Map<String, dynamic> json)
      : imageUrl = json['imageUrl'] as String?,
        prediction = json['prediction'] as String?;

  Map<String, dynamic> toJson() => {
        'imageUrl': imageUrl,
        'prediction': prediction,
      };
}
