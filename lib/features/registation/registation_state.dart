import 'package:equatable/equatable.dart';
import 'package:bitcommerz/config/utilities/enum/bloc_api_state.dart';

class RegistationState extends Equatable {
  final NormalApiState apiState;
  final String errorMessage;
  final String email;

  const RegistationState(
      {required this.apiState,
      required this.errorMessage,
      required this.email});

  @override
  List<Object?> get props => [
        apiState,
        errorMessage,
        email,
      ];

  RegistationState copyWith({
    NormalApiState? apiState,
    String? errorMessage,
    String? email,
  }) {
    return RegistationState(
      apiState: apiState ?? this.apiState,
      email: email ?? this.email,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
