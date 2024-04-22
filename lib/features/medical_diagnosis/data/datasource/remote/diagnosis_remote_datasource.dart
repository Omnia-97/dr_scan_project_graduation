import 'dart:convert';

import 'package:dr_scan_graduation_project/core/data/remote/api_constants.dart';
import 'package:dr_scan_graduation_project/core/data/remote/api_services.dart';
import 'package:dr_scan_graduation_project/core/helpers/list_formatter.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/data/models/diagnosis_model.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/data/models/result_model.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/data/models/symptoms_model.dart';

abstract class DiagnosisRemoteDataSource {
  Future<List<DiagnosisModel>> getDiagnosisPrediction(
      List<SymptomModel> symptoms);
  Future<List<ResultModel>> getAllDiagnosisResult(String accessToken);
  Future saveDiagnosisResult(ResultModel resultModel, String accessToken);
}

class DiagnosisRemoteDataSourceImpl implements DiagnosisRemoteDataSource {
  DiagnosisRemoteDataSourceImpl(this.apiServices);
  final ApiServices apiServices;

  @override
  Future<List<DiagnosisModel>> getDiagnosisPrediction(
    List<SymptomModel> symptoms,
  ) async {
    final body =
        jsonEncode({'symptoms': symptoms.map((e) => e.toJson()).toList()});
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    final response = await apiServices.postData(ApiConstants.diagnosisUrl,
        body: body, headers: headers);
    return ListFormatter.getDiagnosisList(response['diagnosis']);
  }

  @override
  Future<List<ResultModel>> getAllDiagnosisResult(String accessToken) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    final response = await apiServices
        .getData(ApiConstants.getAllDiagnosisResultUrl, headers: headers);
    return ListFormatter.getResultList(response);
  }

  @override
  Future saveDiagnosisResult(
    ResultModel resultModel,
    String accessToken,
  ) async {
    final body = jsonEncode(resultModel.toJson());
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    await apiServices.postData(ApiConstants.saveDiagnosisResultUrl,
        body: body, headers: headers);
  }
}
