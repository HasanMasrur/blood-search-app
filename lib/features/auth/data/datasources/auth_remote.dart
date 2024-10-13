import 'dart:developer';

import 'package:bloodsearchapp/config/const/app/api_endpoints.dart';
import 'package:bloodsearchapp/core/error/api_error_generator.dart';
import 'package:bloodsearchapp/core/error/error.dart';
import 'package:bloodsearchapp/core/network/dio_client/dio_client.dart';
import 'package:bloodsearchapp/core/network/dio_client/request_params.dart';
import 'package:bloodsearchapp/features/auth/data/models/loginUc.dart';
import 'package:bloodsearchapp/features/auth/data/models/otpVerifyUc.dart';
import 'package:bloodsearchapp/features/auth/data/models/registationUc.dart';
import 'package:bloodsearchapp/features/auth/data/models/userModel.dart';
import 'package:dartz/dartz.dart';

class AuthRemoteServices {
  final DioClient _dioClient = DioClient.instance;

  Future<Either<Failure, UserModel>> login({required LogInUc loginUc}) async {
    final APIRequestParam param = APIRequestParam(
      path: ApiEndPoints.login,
      data: loginUc.toJson(),
      doCache: false,
    );
    return await _dioClient.post(param).then((response) {
      return response.fold((l) {
        log("Eror Exception : ${l.response?.statusCode}");
        return Left(ApiErrorGenerator.apiError(l));
      }, (r) {
        try {
          log("success data");
          UserModel userModel = UserModel.fromJson(r.data);
          return Right(userModel);
        } on Exception catch (e) {
          return Left(InvalidFormatFailure(
            message: e.toString(),
          ));
        }
      });
    });
  }

  Future<Either<Failure, dynamic>> signUp(
      {required RegistrationUc registationUc}) async {
    log(registationUc.toJson().toString());
    final APIRequestParam param = APIRequestParam(
      path: ApiEndPoints.sendOtp,
      data: registationUc.toJson(),
      doCache: false,
    );
    return await _dioClient.post(param).then((response) {
      return response.fold((l) {
        log("Eror Exception : ${l.response?.statusCode}");
        return Left(ApiErrorGenerator.apiError(l));
      }, (r) {
        try {
          log("success data");
          return Right(r.data);
        } on Exception catch (e) {
          return Left(InvalidFormatFailure(
            message: e.toString(),
          ));
        }
      });
    });
  }

//otpverify
  Future<Either<Failure, dynamic>> otpVerify(
      {required OtpVerifyUc optVerifyUc}) async {
    final APIRequestParam param = APIRequestParam(
      path: ApiEndPoints.otpVerifyed,
      data: optVerifyUc.toJson(),
      doCache: false,
    );
    return await _dioClient.post(param).then((response) {
      return response.fold((l) {
        log("Eror Exception : ${l.response?.statusCode}");
        return Left(ApiErrorGenerator.apiError(l));
      }, (r) {
        try {
          log("success data");
          return Right(r.data);
        } on Exception catch (e) {
          return Left(InvalidFormatFailure(
            message: e.toString(),
          ));
        }
      });
    });
  }
}
