part of 'app_error_handler_bloc.dart';

sealed class AppErrorHandlerEvent {
  const AppErrorHandlerEvent();
}

class RecheckNetworkConnectivityEvent extends AppErrorHandlerEvent {}

class ChangeConnectionEvent extends AppErrorHandlerEvent {
  final bool hasConnection;

  ChangeConnectionEvent({required this.hasConnection});
}
