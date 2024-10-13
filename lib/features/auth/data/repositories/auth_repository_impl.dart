import 'package:dartz/dartz.dart';
import 'package:bitcommerz/core/error/error.dart';
import 'package:bitcommerz/features/auth/data/datasources/auth_remote.dart';
import 'package:bitcommerz/features/auth/data/models/loginUc.dart';
import 'package:bitcommerz/features/auth/data/models/otpVerifyUc.dart';
import 'package:bitcommerz/features/auth/data/models/registationUc.dart';
import 'package:bitcommerz/features/auth/data/models/shop_setup_uc.dart';
import 'package:bitcommerz/features/auth/domain/entities/user_entities.dart';
import 'package:bitcommerz/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteServices authRemoteServices;

  AuthRepositoryImpl({required this.authRemoteServices});

  @override
  Future<Either<Failure, UserEntities>> getLogin(
      {required LoginUc loginUc}) async {
    return await authRemoteServices.getLogin(loginuc: loginUc);
  }

  @override
  Future<Either<Failure, UserEntities>> shopSetup(
      {required String token, required ShopSetupUc shopSetupUc}) async {
    return await authRemoteServices.shopSetUp(
        token: token, shopSetupUc: shopSetupUc);
  }

  @override
  Future<Either<Failure, dynamic>> registration(
      {required RegistrationUc registrationUc}) async {
    return await authRemoteServices.registrations(
        registationUc: registrationUc);
  }

  @override
  Future<Either<Failure, dynamic>> otpVerify(
      {required OtpVerifyUc otpVerifyUc}) async {
    return await authRemoteServices.otpVerify(optVerifyUc: otpVerifyUc);
  }
}
