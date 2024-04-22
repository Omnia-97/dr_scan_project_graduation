import 'package:dr_scan_graduation_project/features/medical_diagnosis/data/models/symptoms_model.dart';

class QuestionModel {
  QuestionModel({
    required this.title,
    required this.symptom,
  });
  final String title;
  final SymptomModel symptom;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        title: json['question'],
        symptom: SymptomModel.fromJson(json['symptom']),
      );
}
