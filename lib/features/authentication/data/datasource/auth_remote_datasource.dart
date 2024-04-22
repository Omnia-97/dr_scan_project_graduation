import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dr_scan_graduation_project/features/authentication/data/models/user_model.dart';
import 'package:dr_scan_graduation_project/core/data/remote/api_services.dart';
import 'package:dr_scan_graduation_project/core/data/errors/failure.dart';
import 'package:dr_scan_graduation_project/core/helpers/error_handler.dart';
import 'package:dr_scan_graduation_project/core/data/remote/api_constants.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, String>> logInWithCredentials(
      String username, String password);
  Future<Either<Failure, String>> signUpWithCredentials(UserModel user);
  Future<Either<Failure, UserModel>> getUserProfile(String accessToken);
  Future<Either<Failure, Unit>> signOut(String token);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiServices apiServices;
  AuthRemoteDataSourceImpl(this.apiServices);

  @override
  Future<Either<Failure, String>> logInWithCredentials(
      String username, String password) async {
    final body = json.encode({'email': username, 'password': password});
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    try {
      final response = await apiServices.postData(ApiConstants.loginUrl,
          body: body, headers: headers);
      final accessToken = response['token'];
      return Right(accessToken);
    } catch (e) {
      return Left(ErrorHandler.handleException(e as Exception));
    }
  }

  @override
  Future<Either<Failure, String>> signUpWithCredentials(UserModel user) async {
    final body = json.encode(user.toJson());
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    try {
      final response = await apiServices.postData(ApiConstants.registerUrl,
          body: body, headers: headers);
      final accessToken = response['token'];
      return Right(accessToken);
    } catch (e) {
      return Left(ErrorHandler.handleException(e as Exception));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUserProfile(String accessToken) async {
    final headers = {
      'Authorization': 'Bearer $accessToken',
    };
    try {
      final response =
          await apiServices.getData(ApiConstants.profileUrl, headers: headers);
      final user = UserModel.fromJson(response);
      return Right(user);
    } catch (e) {
      return Left(ErrorHandler.handleException(e as Exception));
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut(String token) async {
    try {
      final headers = {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json'
      };
      await apiServices.postData(ApiConstants.signOutUrl, headers: headers);
      return const Right(unit);
    } catch (e) {
      return Left(ErrorHandler.handleException(e as Exception));
    }
  }
}

