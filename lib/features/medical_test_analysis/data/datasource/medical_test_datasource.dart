import 'package:dr_scan_graduation_project/features/medical_test_analysis/data/models/medical_test_model.dart';
import 'package:dr_scan_graduation_project/core/data/remote/api_services.dart';
import 'package:dr_scan_graduation_project/core/data/errors/exceptions.dart';
import 'package:dr_scan_graduation_project/core/data/remote/api_constants.dart';

abstract class MedicalTestRemoteDataSource {
  Future<MedicalTestModel> getMedicalTestPrediction(String testImageFilePath);
}

class MedicalTestRemoteDataSourceImpl implements MedicalTestRemoteDataSource {
  MedicalTestRemoteDataSourceImpl(this.apiServices);
  final ApiServices apiServices;

  @override
  Future<MedicalTestModel> getMedicalTestPrediction(
      String testImageFilePath) async {
    try {
      final response = await apiServices.postFile(
          ApiConstants.medicalTestPredictionUrl, testImageFilePath);
      final medicalTest = MedicalTestModel.fromJson(response);
      return medicalTest;
    } catch (e) {
      throw ServerException();
    }
  }
}
