import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ConnectionLostSnack extends StatelessWidget {
  final VoidCallback onRefreshPressed;

  const ConnectionLostSnack({
    required this.onRefreshPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.primaryContainer,
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black45,
              blurRadius: 10,
            )
          ],
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(LocaleKeys.common_lost_connection.tr()),
            ),
            SizedBox(
              child: FilledButton(
                onPressed: onRefreshPressed,
                child: Text(LocaleKeys.common_retry.tr()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
