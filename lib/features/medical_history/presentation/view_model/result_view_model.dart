import 'package:dr_scan_graduation_project/core/helpers/error_handler.dart';
import 'package:dr_scan_graduation_project/core/utils/binding.dart';
import 'package:dr_scan_graduation_project/core/utils/constants.dart';
import 'package:dr_scan_graduation_project/features/authentication/presentation/view/login_page.dart';
import 'package:dr_scan_graduation_project/features/authentication/presentation/view_model/auth_view_model.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/data/models/result_model.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/data/repository/diagnosis_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultViewModel extends GetxController {
  ResultViewModel(this.diagnosisRepository);
  final DiagnosisRepository diagnosisRepository;

  final _isLoading = Rx<bool>(false);
  bool get isLoading => _isLoading.value;

  final _diagnosisResults = Rx<List<ResultModel>>([]);
  List<ResultModel> get diagnosisResults => _diagnosisResults.value;

  Future<void> getDiagnosisResults() async {
    _isLoading.value = true;
    final String? accessToken = await sl<AuthViewModel>().getCurrentUser();
    if (accessToken == null) {
      Get.snackbar(
        'Login required',
        'Please login to get your diagnosis results',
        duration: const Duration(seconds: 10),
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        icon: const Icon(Icons.error_outline, color: Colors.red),
        mainButton: TextButton(
          onPressed: () => Get.to(() => const LoginPage()),
          child: const Text(
            'Login',
            style: TextStyle(color: kPrimaryColor, fontSize: 18),
          ),
        ),
      );
    } else {
      final result =
          await diagnosisRepository.getAllDiagnosisResult(accessToken);
      result.fold(
        (error) => ErrorHandler.handleError(error),
        (results) => _diagnosisResults.value = results,
      );
    }
    _isLoading.value = false;
    // update();
  }

  @override
  void onInit() {
    getDiagnosisResults();
    super.onInit();
  }
}
