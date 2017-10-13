library test_counter;

import 'package:built_redux/built_redux.dart';
import 'package:built_redux_repatch/built_redux_repatch.dart';
import 'package:built_value/built_value.dart';

part 'test_counter.g.dart';

abstract class TestCounterActions extends ReduxActions {
  ActionDispatcher<Repatch<TestCounter, TestCounterBuilder>> repatchDispatcher;

  TestCounterActions._();
  factory TestCounterActions() => new _$TestCounterActions();
}

// Built Reducer
abstract class TestCounter implements Built<TestCounter, TestCounterBuilder> {
  int get count;

  // Built value constructor
  TestCounter._();
  factory TestCounter() => new _$TestCounter._(count: 1);
}
