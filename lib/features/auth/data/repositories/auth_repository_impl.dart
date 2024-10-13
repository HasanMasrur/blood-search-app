import 'package:bloodsearchapp/features/auth/data/datasources/auth_remote.dart';
import 'package:bloodsearchapp/features/auth/data/models/registationUc.dart';
import 'package:bloodsearchapp/features/auth/domain/entities/user_entities.dart';
import 'package:bloodsearchapp/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteServices authRemoteServices;

  AuthRepositoryImpl({required this.authRemoteServices});

  @override
  Future<Either<Failure, UserEntities>> getLogin(
      {required LoginUc loginUc}) async {
    return await authRemoteServices.getLogin(loginuc: loginUc);
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
