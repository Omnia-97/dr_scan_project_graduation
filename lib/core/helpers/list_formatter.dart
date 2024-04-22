import 'package:dr_scan_graduation_project/features/medical_diagnosis/data/models/diagnosis_model.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/data/models/result_model.dart';

class ListFormatter {
  static List<DiagnosisModel> getDiagnosisList(dynamic data) {
    return List<DiagnosisModel>.from(
        (data as List).map((x) => DiagnosisModel.fromJson(x)));
  }

  static List<ResultModel> getResultList(dynamic data) {
    return List<ResultModel>.from(
        (data as List).map((x) => ResultModel.fromJson(x)));
  }
}
