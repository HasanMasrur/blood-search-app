import 'dart:developer';

import 'package:bloodsearchapp/config/ulilities/enum/bloc_api_state.dart';
import 'package:bloodsearchapp/features/auth/data/models/registationUc.dart';
import 'package:bloodsearchapp/features/auth/domain/usecases/auth_usecase.dart';
import 'package:bloodsearchapp/features/auth/presentation/cubit/registation/registation_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sms_autofill/sms_autofill.dart';

class RegistationCubit extends Cubit<RegistationState> {
  final AuthUseCase authUseCase;
  RegistationCubit({required this.authUseCase})
      : super(
          const RegistationState(
            apiState: NormalApiState.initial,
            phone: '',
            errorMessage: "Please Swipe Down to Refresh",
          ),
        );
  Future<void> signUp(RegistrationUc registationUc) async {
    emit(state.copyWith(apiState: NormalApiState.loading));
    // appkey add [for auto sms fill ]
    String appKey = await SmsAutoFill().getAppSignature;
    log(appKey);
    // if (appKey.isEmpty) {
    //   return;
    // }
    RegistrationUc registationUC = registationUc.copyWith(appKey: "appkey");
    await authUseCase.signUp(registationUc: registationUC).then((res) {
      res.fold((err) {
        return emit(state.copyWith(
            apiState: NormalApiState.failure, errorMessage: err.message));
      }, (suc) {
        return emit(state.copyWith(
            apiState: NormalApiState.loaded,
            phone: suc['phone_number'],
            errorMessage: ""));
      });
    }).onError((error, stackTrace) {
      emit(
        state.copyWith(
            apiState: NormalApiState.failure, errorMessage: error.toString()),
      );
    });
  }
}
