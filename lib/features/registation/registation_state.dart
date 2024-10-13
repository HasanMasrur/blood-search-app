import 'package:bloodsearchapp/config/ulilities/enum/bloc_api_state.dart';
import 'package:equatable/equatable.dart';

class RegistationState extends Equatable {
  final NormalApiState apiState;
  final String errorMessage;
  final String phone;

  const RegistationState(
      {required this.apiState,
      required this.errorMessage,
      required this.phone});

  @override
  List<Object?> get props => [
        apiState,
        errorMessage,
        phone,
      ];

  RegistationState copyWith({
    NormalApiState? apiState,
    String? errorMessage,
    String? phone,
  }) {
    return RegistationState(
      apiState: apiState ?? this.apiState,
      phone: phone ?? this.phone,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
