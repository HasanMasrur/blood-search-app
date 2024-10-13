import 'package:bloodsearchapp/config/ulilities/enum/bloc_api_state.dart';
import 'package:bloodsearchapp/features/auth/data/models/otpVerifyUc.dart';
import 'package:bloodsearchapp/features/auth/domain/usecases/auth_usecase.dart';
import 'package:bloodsearchapp/features/auth/presentation/cubit/otp_verify/otp_verify_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class OtpVerifyCubit extends Cubit<OtpVerifyState> {
  final AuthUseCase authUseCase;

  OtpVerifyCubit({required this.authUseCase})
      : super(
          const OtpVerifyState(
            apiState: NormalApiState.initial,
            errorMessage: "Please Swipe Down to Refresh",
          ),
        );

  int packageId = 0;

  Future<void> otpVerify(OtpVerifyUc otpVerifyUc) async {
    emit(state.copyWith(apiState: NormalApiState.loading));
    await authUseCase.otpVerify(otpVerifyUc: otpVerifyUc).then((res) {
      res.fold((err) {
        return emit(state.copyWith(
            apiState: NormalApiState.failure, errorMessage: err.message));
      }, (suc) {
        return emit(
            state.copyWith(apiState: NormalApiState.loaded, errorMessage: ""));
      });
    }).onError((error, stackTrace) {
      emit(
        state.copyWith(
            apiState: NormalApiState.failure, errorMessage: error.toString()),
      );
    });
  }
}
