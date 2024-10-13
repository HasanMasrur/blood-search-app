import 'package:dartz/dartz.dart';
import 'package:bitcommerz/core/error/error.dart';
import 'package:bitcommerz/features/auth/data/models/loginUc.dart';
import 'package:bitcommerz/features/auth/data/models/otpVerifyUc.dart';
import 'package:bitcommerz/features/auth/data/models/registationUc.dart';
import 'package:bitcommerz/features/auth/data/models/shop_setup_uc.dart';
import 'package:bitcommerz/features/auth/domain/entities/user_entities.dart';
import 'package:bitcommerz/features/auth/domain/repositories/auth_repository.dart';

class AuthUseCase {
  final AuthRepository authRepository;

  AuthUseCase({required this.authRepository});

  Future<Either<Failure, UserEntities>> getLogin(
      {required LoginUc loginUc}) async {
    return await authRepository.getLogin(loginUc: loginUc);
  }

  Future<Either<Failure, dynamic>> registration(
      {required RegistrationUc registationUc}) async {
    return await authRepository.registration(registrationUc: registationUc);
  }

  Future<Either<Failure, dynamic>> otpVerify(
      {required OtpVerifyUc otpVerifyUc}) async {
    return await authRepository.otpVerify(otpVerifyUc: otpVerifyUc);
  }

  Future<Either<Failure, UserEntities>> shopSetup(
      {required String token, required ShopSetupUc shopSetup}) async {
    return await authRepository.shopSetup(token: token, shopSetupUc: shopSetup);
  }
}
