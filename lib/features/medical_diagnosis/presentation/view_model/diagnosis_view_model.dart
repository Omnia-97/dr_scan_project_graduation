import 'package:dr_scan_graduation_project/core/helpers/date_formatter.dart';
import 'package:dr_scan_graduation_project/core/helpers/error_handler.dart';
import 'package:dr_scan_graduation_project/core/utils/binding.dart';
import 'package:dr_scan_graduation_project/core/utils/snack_bar_utils.dart';
import 'package:dr_scan_graduation_project/features/authentication/presentation/view_model/auth_view_model.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/data/models/diagnosis_model.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/data/models/result_model.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/data/models/symptoms_model.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/data/repository/diagnosis_repository.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/presentation/view_model/symptoms_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiagnosisViewModel extends GetxController {
  DiagnosisViewModel(this.diagnosisRepository);
  final DiagnosisRepository diagnosisRepository;

  final _selectedSymptoms = sl<SymptomsViewModel>().selectedSymptoms;

  final _diagnosis = Rx<List<DiagnosisModel>>([]);
  List<DiagnosisModel> get diagnosis => _diagnosis.value;

  final _isSaved = false.obs;
  bool get isSaved => _isSaved.value;

  final pageController = PageController(viewportFraction: 0.9, keepPage: true);

  void addSymptom(SymptomModel symptom) {
    _selectedSymptoms.add(symptom);
    update();
  }

  void removeSymptom(SymptomModel symptom) {
    _selectedSymptoms.removeWhere((s) => s.name == symptom.name);
    update();
  }

  predictDiagnosis() async {
    final result =
        await diagnosisRepository.getDiagnosisPrediction(_selectedSymptoms);
    result.fold(
      (failure) => ErrorHandler.handleError(failure),
      (diagnosis) => _diagnosis.value = diagnosis,
    );
  }

  void saveDiagnosisResult() async {
    _isSaved.value = false;
    final accessToken = await sl<AuthViewModel>().getCurrentUser();
    if (accessToken == null) {
      SnackBarUtils.showLoginSnackBar();
    } else {
      await diagnosisRepository.saveDiagnosisResult(
        accessToken,
        ResultModel(
          date: DateTimeFormatter.formatDate(DateTime.now()),
          time: DateTimeFormatter.formatTime(DateTime.now()),
          diagnosis: _diagnosis.value,
          symptoms: _selectedSymptoms,
        ),
      );
      _isSaved.value = true;
    }
  }

  void nextPage(SymptomModel? symptom, bool? answer) {
    if (pageController.page != 2) {
      pageController.animateToPage(pageController.page!.toInt() + 1,
          duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
      if (answer != null && symptom != null) {
        if (answer) {
          addSymptom(symptom);
        } else {
          removeSymptom(symptom);
        }
      }
    } else {
      if (answer != null && symptom != null) {
        if (answer) {
          addSymptom(symptom);
        } else {
          removeSymptom(symptom);
        }
      }
    }
  }

  void previousPage() {
    if (pageController.page == 0) {
      Get.back();
    } else {
      pageController.animateToPage(pageController.page!.toInt() - 1,
          duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
    }
  }
}
