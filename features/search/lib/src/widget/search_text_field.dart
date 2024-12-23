import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController _controller;
  final Function(String) _onChanged;

  const SearchTextField({
    required TextEditingController controller,
    required Function(String) onChanged,
  })  : _onChanged = onChanged,
        _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.3),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: _onChanged,
      ),
    );
  }
}
