import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:bitcommerz/core/error/api_error_generator.dart';
import 'package:bitcommerz/core/error/error.dart';
import 'package:bitcommerz/core/network/dio_client/dio_client.dart';
import 'package:bitcommerz/core/network/dio_client/request_params.dart';
import 'package:bitcommerz/features/auth/data/models/loginUc.dart';
import 'package:bitcommerz/features/auth/data/models/otpVerifyUc.dart';
import 'package:bitcommerz/features/auth/data/models/registationUc.dart';
import 'package:bitcommerz/features/auth/data/models/shop_setup_uc.dart';
import 'package:bitcommerz/features/auth/data/models/user_model.dart';

class AuthRemoteServices {
  final DioClient _dioClient = DioClient.instance;

  Future<Either<Failure, UserModel>> getLogin(
      {required LoginUc loginuc}) async {
    final APIRequestParam param = APIRequestParam(
      path: 'https://api.bitcommerz.com/api/v1/auth/admin/login',
      data: loginuc.toJson(),
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

  Future<Either<Failure, dynamic>> registrations(
      {required RegistrationUc registationUc}) async {
    final APIRequestParam param = APIRequestParam(
      path: 'https://api.bitcommerz.com/api/v1/user/admin/create',
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
      path: 'https://api.bitcommerz.com/api/v1/user/admin/verify-otp',
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

  // ShopSetup api called
  Future<Either<Failure, UserModel>> shopSetUp(
      {required String token, required ShopSetupUc shopSetupUc}) async {
    log("token is $token, shopSetUp ${shopSetupUc.toJson()}");
    List<String> imageType = shopSetupUc.file.split('.');
    FormData formData = FormData.fromMap({
      "name": shopSetupUc.name,
      "type": shopSetupUc.type,
      "slug": shopSetupUc.customDomain,
      "themeId": shopSetupUc.themeId,
      "productType": shopSetupUc.productType,
      "file": await MultipartFile.fromFile(shopSetupUc.file,
          filename: imageType.last),
    });

    final APIRequestParam param = APIRequestParam(
      path: 'https://api.bitcommerz.com/api/v1/shop/setup',
      options: Options(headers: {"Authorization": "Bearer $token"}),
      data: formData,
      doCache: false,
    );
    return await _dioClient.post(param).then((response) {
      return response.fold((l) {
        log("Eror Exception : ${l.response?.statusCode}");
        return Left(ApiErrorGenerator.apiError(l));
      }, (r) {
        try {
          log("Theme success data ${r.data}");
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
}
