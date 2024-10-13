import 'dart:developer';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:bitcommerz/config/utilities/enum/bloc_api_state.dart';
import 'package:bitcommerz/features/auth/data/models/registationUc.dart';
import 'package:bitcommerz/features/auth/domain/usecases/auth_usecase.dart';
import 'package:bitcommerz/features/auth/presentation/cubit/registation/registation_state.dart';

class RegistationCubit extends Cubit<RegistationState> {
  final AuthUseCase authUseCase;

  RegistationCubit({required this.authUseCase})
      : super(
          const RegistationState(
            apiState: NormalApiState.initial,
            email: '',
            errorMessage: "Please Swipe Down to Refresh",
          ),
        );

  int packageId = 0;

  Future<void> getRegistations(RegistrationUc registationUc) async {
    emit(state.copyWith(apiState: NormalApiState.loading));
    await authUseCase.registration(registationUc: registationUc).then((res) {
      res.fold((err) {
        log("call err ${err.toString()}");
        return emit(state.copyWith(
            apiState: NormalApiState.failure, errorMessage: err.message));
      }, (suc) {
        return emit(state.copyWith(
            apiState: NormalApiState.loaded,
            email: suc['email'],
            errorMessage: ""));
      });
    }).onError((error, stackTrace) {
      log("Error cubit 2 : ${error.toString()}");
      emit(
        state.copyWith(
            apiState: NormalApiState.failure, errorMessage: error.toString()),
      );
    });
  }
}
