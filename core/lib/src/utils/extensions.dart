import 'package:flutter/material.dart';

import '../../core.dart';

extension LocaleObserver on String {
  String watchTr(
    BuildContext context, {
    List<String>? args,
    Map<String, String>? namedArgs,
    String? gender,
  }) {
    context.locale;
    return this.tr(args: args, namedArgs: namedArgs, gender: gender);
  }
}

extension AddIfNotExists on List<dynamic> {
  void addNew<T>(dynamic item) {
    remove(item);
    add(item);
  }
}
