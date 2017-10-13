import 'package:built_redux/built_redux.dart';
import 'package:built_redux_repatch/built_redux_repatch.dart';
import 'package:test/test.dart';

import 'test_counter.dart';

main() {
  group('redux', () {
    Store<TestCounter, TestCounterBuilder, TestCounterActions> store;
    setup() {
      var actions = new TestCounterActions();
      var defaultValue = new TestCounter();

      store = new Store<TestCounter, TestCounterBuilder, TestCounterActions>(
        createRepatchReducer<TestCounter, TestCounterBuilder>(),
        defaultValue,
        actions,
      );
    }

    tearDown(() {
      store.dispose();
    });

    test('async action updates state', () async {
      setup();
      store.actions.repatchDispatcher(
          (TestCounter state, TestCounterBuilder builder) =>
              builder.count += 4);
      var stateChange = await store.stream.first;
      expect(stateChange.prev.count, 1);
      expect(stateChange.next.count, 5);
    });
  });
}
