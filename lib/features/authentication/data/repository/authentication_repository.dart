import 'package:dartz/dartz.dart';
import 'package:dr_scan_graduation_project/features/authentication/data/datasource/auth_local_datasource.dart';
import 'package:dr_scan_graduation_project/features/authentication/data/datasource/auth_remote_datasource.dart';
import 'package:dr_scan_graduation_project/features/authentication/data/models/user_model.dart';
import 'package:dr_scan_graduation_project/core/data/errors/failure.dart';
import 'package:dr_scan_graduation_project/core/helpers/error_handler.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> signUp(UserModel user);
  Future<Either<Failure, String>> login(String username, String password);
  Future<Either<Failure, UserModel>> getUserProfile(String accessToken);
  Future<Either<Failure, String?>> getCurrentUser();
  Future<Either<Failure, Unit>> signOut();
}

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(
    this.localDataSource,
    this.remoteDataSource,
  );
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, String>> signUp(UserModel user) async {
    try {
      final signUpResponse = await remoteDataSource.signUpWithCredentials(user);
      return signUpResponse.fold(
        (error) => Left(error),
        (token) {
          localDataSource.cacheToken(token);
          return Right(token);
        },
      );
    } catch (e) {
      return Left(ErrorHandler.handleException(e as Exception));
    }
  }

  @override
  Future<Either<Failure, String>> login(
      String username, String password) async {
    try {
      final loginResponse =
          await remoteDataSource.logInWithCredentials(username, password);
      return loginResponse.fold(
        (error) => Left(error),
        (token) {
          localDataSource.cacheToken(token);
          return Right(token);
        },
      );
    } catch (e) {
      return Left(ErrorHandler.handleException(e as Exception));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUserProfile(String accessToken) async {
    try {
      final user = await remoteDataSource.getUserProfile(accessToken);
      return user.fold(
        (error) => Left(error),
        (user) => Right(user),
      );
    } catch (e) {
      return Left(ErrorHandler.handleException(e as Exception));
    }
  }

  @override
  Future<Either<Failure, String?>> getCurrentUser() async {
    try {
      final token = await localDataSource.getToken();
      return Right(token);
    } catch (e) {
      return Left(ErrorHandler.handleException(e as Exception));
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      final currentUserToken = await localDataSource.getToken();
      await remoteDataSource.signOut(currentUserToken!);
      await localDataSource.clearToken();
      return const Right(unit);
    } catch (e) {
      return Left(ErrorHandler.handleException(e as Exception));
    }
  }
}

// const String baseUrl = 'https://api.escuelajs.co/api/v1/';
