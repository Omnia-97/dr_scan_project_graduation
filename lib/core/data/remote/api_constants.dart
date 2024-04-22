class ApiConstants {
  static const String baseUrl = 'https://open-shoes-listen.loca.lt/api';

  // authentication
  static const String loginUrl = '$baseUrl/login';
  static const String registerUrl = '$baseUrl/register';
  static const String profileUrl = '$baseUrl/userInfo';
  static const String signOutUrl = '$baseUrl/logout';

  // medical test analysis
  static const String medicalTestPredictionUrl =
      'http://192.168.1.2:5000/predict';

  // diagnosis prediction
  static const String diagnosisUrl = 'http://192.168.1.9:8080/diagnosis';

  // diagnosis result
  static const String getAllDiagnosisResultUrl = '$baseUrl/diagnosis_result';
  static const String saveDiagnosisResultUrl = '$baseUrl/save_diagnosis';
}
