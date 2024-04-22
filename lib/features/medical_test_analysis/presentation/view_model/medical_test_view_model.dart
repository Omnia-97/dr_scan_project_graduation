import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:dr_scan_graduation_project/features/medical_test_analysis/data/repository/medical_test_repository.dart';

class MedicalTestViewModel extends GetxController {
  MedicalTestViewModel(this.medicalTestRepositoryImpl);
  final MedicalTestRepository medicalTestRepositoryImpl;

  File imageFile = File('');

  Future pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    } else {
      imageFile = File('');
      print('No image selected.');
    }
  }

  Future uploadImageToServer(ImageSource source) async {
    await pickImage(source);
    if (imageFile.path.isNotEmpty) {
      final result = await medicalTestRepositoryImpl
          .getMedicalTestPrediction(imageFile.path);
      result.fold(
        (l) => print(l),
        (r) => print(r.prediction),
      );
    } else {
      print('No image selected.');
    }
  }
}
