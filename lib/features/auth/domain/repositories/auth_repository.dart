import 'package:bloodsearchapp/core/error/error.dart';
import 'package:bloodsearchapp/features/auth/data/models/loginUc.dart';
import 'package:bloodsearchapp/features/auth/data/models/otpVerifyUc.dart';
import 'package:bloodsearchapp/features/auth/data/models/registationUc.dart';
import 'package:bloodsearchapp/features/auth/domain/entities/user_entities.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntities>> login({required LogInUc loginUc});
  Future<Either<Failure, dynamic>> registration(
      {required RegistrationUc registrationUc});
  Future<Either<Failure, dynamic>> otpVerify(
      {required OtpVerifyUc otpVerifyUc});
}
