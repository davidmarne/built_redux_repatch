import 'package:built_redux/built_redux.dart';
import 'package:built_value/built_value.dart';

typedef void Repatch<V extends Built<V, B>, B extends Builder<V, B>>(
    V state, B builder);

Reducer<V, B, dynamic>
    createRepatchReducer<V extends Built<V, B>, B extends Builder<V, B>>() =>
        (V state, Action<dynamic> action, B builder) {
          if (action.payload is Repatch<V, B>) action.payload(state, builder);
        };
