import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../bloc/app_error_handler_bloc.dart';
import '../constants/snack_align.dart';
import 'connection_lost_snack.dart';

class ConnectionLostWrapper extends StatefulWidget {
  final Widget child;
  final SnackAlign align;
  final EdgeInsets padding;

  const ConnectionLostWrapper({
    required this.child,
    required this.align,
    required this.padding,
    super.key,
  });

  @override
  State<ConnectionLostWrapper> createState() => _ConnectionLostWrapperState();
}

class _ConnectionLostWrapperState extends State<ConnectionLostWrapper>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    final double yOffset;
    switch (widget.align) {
      case SnackAlign.top:
        yOffset = -4;
      case SnackAlign.bottom:
        yOffset = 4;
    }
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, yOffset),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final bool hasConnection = context.read<AppErrorHandlerBloc>().state.hasConnection;
    if (hasConnection) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Alignment align;
    switch (widget.align) {
      case SnackAlign.top:
        align = Alignment.topCenter;
      case SnackAlign.bottom:
      default:
        align = Alignment.bottomCenter;
    }
    return BlocListener<AppErrorHandlerBloc, AppErrorHandlerState>(
      listener: (BuildContext context, AppErrorHandlerState state) async {
        if (state.hasConnection) {
          await _animationController.reverse();
        } else {
          await _animationController.forward();
        }
      },
      listenWhen: (AppErrorHandlerState previous, AppErrorHandlerState current) {
        return previous.hasConnection != current.hasConnection;
      },
      child: Stack(
        children: <Widget>[
          widget.child,
          SafeArea(
            child: Align(
              alignment: align,
              child: Padding(
                padding: widget.padding,
                child: SlideTransition(
                  position: _offsetAnimation,
                  child: ConnectionLostSnack(
                    onRefreshPressed: () {
                      context.read<AppErrorHandlerBloc>().add(RecheckNetworkConnectivityEvent());
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
