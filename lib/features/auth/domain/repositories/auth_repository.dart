import 'package:dartz/dartz.dart';
import 'package:bitcommerz/core/error/error.dart';
import 'package:bitcommerz/features/auth/data/models/loginUc.dart';
import 'package:bitcommerz/features/auth/data/models/otpVerifyUc.dart';
import 'package:bitcommerz/features/auth/data/models/registationUc.dart';
import 'package:bitcommerz/features/auth/data/models/shop_setup_uc.dart';
import 'package:bitcommerz/features/auth/domain/entities/user_entities.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntities>> getLogin({required LoginUc loginUc});
  Future<Either<Failure, dynamic>> registration(
      {required RegistrationUc registrationUc});

  Future<Either<Failure, UserEntities>> shopSetup(
      {required String token, required ShopSetupUc shopSetupUc});

  Future<Either<Failure, dynamic>> otpVerify(
      {required OtpVerifyUc otpVerifyUc});
}
