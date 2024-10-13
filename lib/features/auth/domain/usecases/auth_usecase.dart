import 'package:bloodsearchapp/core/error/error.dart';
import 'package:bloodsearchapp/features/auth/data/models/loginUc.dart';
import 'package:bloodsearchapp/features/auth/data/models/otpVerifyUc.dart';
import 'package:bloodsearchapp/features/auth/data/models/registationUc.dart';
import 'package:bloodsearchapp/features/auth/domain/entities/user_entities.dart';
import 'package:bloodsearchapp/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

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
}
