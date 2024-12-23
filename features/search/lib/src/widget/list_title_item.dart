import 'package:flutter/material.dart';

class ListTitleItem extends StatelessWidget {
  final bool _isVisible;
  final String _title;

  const ListTitleItem({
    super.key,
    required String title,
    required bool isVisible,
  })  : _isVisible = isVisible,
        _title = title;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          _title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
