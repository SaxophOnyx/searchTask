part of 'app_error_handler_bloc.dart';

@freezed
class AppErrorHandlerState with _$AppErrorHandlerState {
  const factory AppErrorHandlerState({
    required bool hasConnection,
  }) = _AppErrorHandlerState;

  factory AppErrorHandlerState.initial() {
    return const AppErrorHandlerState(
      hasConnection: true,
    );
  }
}
