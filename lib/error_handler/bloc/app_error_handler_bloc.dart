import 'dart:async';
import 'package:core/core.dart';
part 'app_error_handler_bloc.freezed.dart';

part 'app_error_handler_event.dart';

part 'app_error_handler_state.dart';

class AppErrorHandlerBloc extends Bloc<AppErrorHandlerEvent, AppErrorHandlerState> {
  late final StreamSubscription<bool> _internetConnectivitySubscription;

  AppErrorHandlerBloc() : super(AppErrorHandlerState.initial()) {
    on<ChangeConnectionEvent>(_changeConnection);
    on<RecheckNetworkConnectivityEvent>(_recheckNetworkConnectivityEvent);
    _internetConnectivitySubscription = AppNetworkService.observeConnection.listen(
      (bool hasConnection) {
        add(ChangeConnectionEvent(hasConnection: hasConnection));
      },
    );
  }

  Future<void> _recheckNetworkConnectivityEvent(
    RecheckNetworkConnectivityEvent event,
    Emitter<AppErrorHandlerState> emit,
  ) async {
    add(
      ChangeConnectionEvent(
        hasConnection: await AppNetworkService.hasConnection,
      ),
    );
  }

  void _changeConnection(
    ChangeConnectionEvent event,
    Emitter<AppErrorHandlerState> emit,
  ) {
    emit(state.copyWith(hasConnection: event.hasConnection));
  }

  @override
  Future<void> close() async {
    await _internetConnectivitySubscription.cancel();
    await super.close();
  }
}
