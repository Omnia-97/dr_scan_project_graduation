import 'package:dr_scan_graduation_project/core/helpers/error_handler.dart';
import 'package:dr_scan_graduation_project/core/utils/enums.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/data/models/symptoms_model.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/data/repository/diagnosis_repository.dart';
import 'package:get/get.dart';

class SymptomsViewModel extends GetxController {
  SymptomsViewModel(this.diagnosisRepository);
  final DiagnosisRepository diagnosisRepository;

  final _symptoms = Rx<List<SymptomModel>>([]);
  List<SymptomModel> get symptoms => _symptoms.value;

  final _selectedSymptoms = Rx<List<SymptomModel>>([]);
  List<SymptomModel> get selectedSymptoms => _selectedSymptoms.value;

  Future<void> getSymptoms(BodyPart bodyPart) async {
    final result = await diagnosisRepository.getSymptomsList();
    result.fold(
      (failure) => ErrorHandler.handleError(failure),
      (symptoms) {
        _symptoms.value = symptoms
            .where((symptom) => symptom.category.contains(bodyPart))
            .toList();
      },
    );
    update();
  }

  void toggleSelection(int index) {
    final symptom = _symptoms.value[index];
    final isSelected = !symptom.isSelected;

    final updatedSymptom = symptom.copyWith(isSelected: isSelected);
    _symptoms.value[index] = updatedSymptom;

    if (isSelected) {
      _selectedSymptoms.value.add(updatedSymptom);
    } else {
      _selectedSymptoms.value.removeWhere((s) => s.name == updatedSymptom.name);
    }
    update();
  }
}
