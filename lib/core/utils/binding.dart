import 'package:get/get.dart';

import 'package:dr_scan_graduation_project/core/data/local/local_database_services.dart';
import 'package:dr_scan_graduation_project/core/data/remote/api_services.dart';
import 'package:dr_scan_graduation_project/core/data/remote/network_checker.dart';
import 'package:dr_scan_graduation_project/features/authentication/data/datasource/auth_local_datasource.dart';
import 'package:dr_scan_graduation_project/features/authentication/data/datasource/auth_remote_datasource.dart';
import 'package:dr_scan_graduation_project/features/authentication/data/repository/authentication_repository.dart';
import 'package:dr_scan_graduation_project/features/authentication/presentation/view_model/auth_view_model.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/data/datasource/local/diagnosis_local_datasource.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/data/datasource/remote/diagnosis_remote_datasource.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/data/repository/diagnosis_repository.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/presentation/view_model/body_part_view_model.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/presentation/view_model/diagnosis_view_model.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/presentation/view_model/questions_view_model.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/presentation/view_model/symptoms_view_model.dart';
import 'package:dr_scan_graduation_project/features/medical_history/presentation/view_model/result_view_model.dart';
import 'package:dr_scan_graduation_project/features/medical_test_analysis/data/datasource/medical_test_datasource.dart';
import 'package:dr_scan_graduation_project/features/medical_test_analysis/data/repository/medical_test_repository.dart';
import 'package:dr_scan_graduation_project/features/medical_test_analysis/presentation/view_model/medical_test_view_model.dart';

final sl = Get.find;

class Binding extends Bindings {
  @override
  void dependencies() {
    // Core
    Get.lazyPut<NetworkChecker>(() => NetworkChecker());
    Get.put<ApiServices>(ApiServices(sl()));
    Get.put<LocalDatabaseService>(LocalDatabaseService());

    // Authentication
    Get.lazyPut<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(sl()),
        fenix: true);
    Get.lazyPut<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(sl()),
        fenix: true);
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(sl(), sl()),
        fenix: true);
    Get.lazyPut<AuthViewModel>(() => AuthViewModel(sl()), fenix: true);

    // Medical Test Analysis
    Get.lazyPut<MedicalTestRemoteDataSource>(
        () => MedicalTestRemoteDataSourceImpl(sl()),
        fenix: true);
    Get.lazyPut<MedicalTestRepository>(() => MedicalTestRepositoryImpl(sl()),
        fenix: true);
    Get.lazyPut<MedicalTestViewModel>(() => MedicalTestViewModel(sl()),
        fenix: true);

    // Medical Diagnosis
    Get.lazyPut<DiagnosisLocalDataSource>(() => DiagnosisLocalDataSourceImpl(),
        fenix: true);
    Get.lazyPut<DiagnosisRemoteDataSource>(
        () => DiagnosisRemoteDataSourceImpl(sl()),
        fenix: true);
    Get.lazyPut<BodyPartViewModel>(() => BodyPartViewModel(), fenix: true);
    Get.lazyPut<DiagnosisRepository>(() => DiagnosisRepositoryImpl(sl(), sl()),
        fenix: true);
    Get.lazyPut<SymptomsViewModel>(() => SymptomsViewModel(sl()), fenix: true);
    Get.lazyPut<QuestionsViewModel>(() => QuestionsViewModel(sl()),
        fenix: true);
    Get.lazyPut<DiagnosisViewModel>(() => DiagnosisViewModel(sl()),
        fenix: true);

    // Medical History
    Get.lazyPut<ResultViewModel>(() => ResultViewModel(sl()), fenix: true);
  }
}
