import 'package:built_redux/built_redux.dart';
import 'package:built_value/built_value.dart';

typedef void Repatch<V extends Built<V, B>, B extends Builder<V, B>>(
    V state, B builder);

Reducer<V, B, Repatch<V, B>>
    createRepatchReducer<V extends Built<V, B>, B extends Builder<V, B>>() =>
        (V state, Action<Repatch<V, B>> action, B builder) {
          action.payload(state, builder);
        };
