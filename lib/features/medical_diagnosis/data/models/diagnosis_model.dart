class DiagnosisModel {
  DiagnosisModel({
    required this.prediction,
    required this.confidence,
  });
  final String prediction;
  final double confidence;

  factory DiagnosisModel.fromJson(Map<String, dynamic> json) => DiagnosisModel(
        prediction: json["prediction"],
        confidence: json["confidence"],
      );

  Map<String, dynamic> toJson() => {
        "prediction": prediction,
        "confidence": confidence,
      };
}
