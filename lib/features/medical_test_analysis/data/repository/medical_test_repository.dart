import 'package:dartz/dartz.dart';
import 'package:dr_scan_graduation_project/features/medical_test_analysis/data/datasource/medical_test_datasource.dart';
import 'package:dr_scan_graduation_project/features/medical_test_analysis/data/models/medical_test_model.dart';
import 'package:dr_scan_graduation_project/core/data/errors/failure.dart';

abstract class MedicalTestRepository {
  Future<Either<Failure, MedicalTestModel>> getMedicalTestPrediction(
      String testImageFilePath);
}

class MedicalTestRepositoryImpl implements MedicalTestRepository {
  MedicalTestRepositoryImpl(this.remoteDataSource);
  final MedicalTestRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, MedicalTestModel>> getMedicalTestPrediction(
      String testImageFilePath) async {
    try {
      final medicalTest =
          await remoteDataSource.getMedicalTestPrediction(testImageFilePath);
      return Right(medicalTest);
    } on NetworkFailure catch (_) {
      return Left(NetworkFailure());
    } on ServerFailure catch (_) {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }
}
