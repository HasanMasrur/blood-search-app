import 'package:bloodsearchapp/config/ulilities/enum/bloc_api_state.dart';
import 'package:equatable/equatable.dart';

class OtpVerifyState extends Equatable {
  final NormalApiState apiState;
  final String errorMessage;

  const OtpVerifyState({
    required this.apiState,
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [
        apiState,
        errorMessage,
      ];

  OtpVerifyState copyWith({
    NormalApiState? apiState,
    String? errorMessage,
  }) {
    return OtpVerifyState(
      apiState: apiState ?? this.apiState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
