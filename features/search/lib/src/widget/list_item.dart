import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final Function()? _onTap;
  final String _title;

  const ListItem({
    required String title,
    Function()? onTap,
    super.key,
  })  : _title = title,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Text(_title),
      ),
    );
  }
}
