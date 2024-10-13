import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntities>> getLogin({required LoginUc loginUc});
  Future<Either<Failure, dynamic>> registration(
      {required RegistrationUc registrationUc});

  Future<Either<Failure, dynamic>> otpVerify(
      {required OtpVerifyUc otpVerifyUc});
}
