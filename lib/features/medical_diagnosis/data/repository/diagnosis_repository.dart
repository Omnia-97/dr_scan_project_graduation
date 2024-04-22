import 'package:dartz/dartz.dart';
import 'package:dr_scan_graduation_project/core/data/errors/failure.dart';
import 'package:dr_scan_graduation_project/core/helpers/error_handler.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/data/datasource/local/diagnosis_local_datasource.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/data/datasource/remote/diagnosis_remote_datasource.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/data/models/diagnosis_model.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/data/models/question_model.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/data/models/result_model.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/data/models/symptoms_model.dart';

abstract class DiagnosisRepository {
  Future<Either<Failure, List<SymptomModel>>> getSymptomsList();
  Future<Either<Failure, List<QuestionModel>>> getQuestionList();
  Future<Either<Failure, List<DiagnosisModel>>> getDiagnosisPrediction(
      List<SymptomModel> symptoms);
  Future<Either<Failure, List<ResultModel>>> getAllDiagnosisResult(
      String accessToken);
  Future<Either<Failure, Unit>> saveDiagnosisResult(
      String accessToken, ResultModel resultModel);
}

class DiagnosisRepositoryImpl extends DiagnosisRepository {
  DiagnosisRepositoryImpl(this.localDataSource, this.remoteDataSource);
  final DiagnosisLocalDataSource localDataSource;
  final DiagnosisRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<SymptomModel>>> getSymptomsList() async {
    try {
      return Right(await localDataSource.getSymptomsList());
    } catch (e) {
      return Left(ErrorHandler.handleException(e as Exception));
    }
  }

  @override
  Future<Either<Failure, List<QuestionModel>>> getQuestionList() async {
    try {
      return Right(await localDataSource.getQuestionList());
    } catch (e) {
      return Left(ErrorHandler.handleException(e as Exception));
    }
  }

  @override
  Future<Either<Failure, List<DiagnosisModel>>> getDiagnosisPrediction(
      List<SymptomModel> symptoms) async {
    try {
      return Right(await remoteDataSource.getDiagnosisPrediction(symptoms));
    } catch (e) {
      return Left(ErrorHandler.handleException(e as Exception));
    }
  }

  @override
  Future<Either<Failure, List<ResultModel>>> getAllDiagnosisResult(
      String accessToken) async {
    try {
      return Right(await remoteDataSource.getAllDiagnosisResult(accessToken));
    } catch (e) {
      return Left(ErrorHandler.handleException(e as Exception));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveDiagnosisResult(
      String accessToken, ResultModel resultModel) async {
    try {
      await remoteDataSource.saveDiagnosisResult(resultModel, accessToken);
      return const Right(unit);
    } catch (e) {
      return Left(ErrorHandler.handleException(e as Exception));
    }
  }
}
