import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

abstract class BlocUtils {
  static EventTransformer<T> searchTransformer<T>() =>
      (Stream<T> events, EventMapper<T> transformer) =>
          events.debounceTime(const Duration(seconds: 1)).switchMap(transformer);
}
