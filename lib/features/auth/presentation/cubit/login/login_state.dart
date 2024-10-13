import 'package:bloodsearchapp/features/auth/domain/entities/user_entities.dart';
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final NormalApiState apiState;
  final String errorMessage;
  final UserEntities userEntities;

  const LoginState(
      {required this.apiState,
      required this.errorMessage,
      required this.userEntities});

  @override
  List<Object?> get props => [
        apiState,
        errorMessage,
      ];

  LoginState copyWith({
    NormalApiState? apiState,
    String? errorMessage,
    UserEntities? userEntities,
  }) {
    return LoginState(
      apiState: apiState ?? this.apiState,
      userEntities: userEntities ?? this.userEntities,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
