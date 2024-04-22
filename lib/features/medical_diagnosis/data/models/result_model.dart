import 'package:dr_scan_graduation_project/features/medical_diagnosis/data/models/diagnosis_model.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/data/models/symptoms_model.dart';

class ResultModel {
  ResultModel({
    this.id,
    required this.date,
    required this.time,
    required this.diagnosis,
    required this.symptoms,
  });
  final int? id;
  final String date;
  final String time;
  final List<DiagnosisModel> diagnosis;
  final List<SymptomModel> symptoms;

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        id: json["id"],
        date: json["date"],
        time: json["time"],
        diagnosis: List<DiagnosisModel>.from(
            (json["diagnosis"] as List).map((x) => DiagnosisModel.fromJson(x))),
        symptoms: List<SymptomModel>.from(
            (json["symptoms"] as List).map((x) => SymptomModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "time": time,
        "diagnosis": List<dynamic>.from(diagnosis.map((x) => x.toJson())),
        "symptoms": List<dynamic>.from(symptoms.map((x) => x.toJson())),
      };
}
