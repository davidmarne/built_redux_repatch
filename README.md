## Repatch

By adding a single repatch action dispatcher, one can dispatch builder functions as an action payload.
This means one does not have to create an action dispatcher for every reducer, they can dispatch reducers directly.

### Example

Add an action dispatcher:

```dart
abstract class CounterActions extends ReduxActions {
  ActionDispatcher<Repatch<Counter, CounterBuilder>> repatchDispatcher;

  // factory to create on instance of the generated implementation of CounterActions
  CounterActions._();
  factory CounterActions() => new _$CounterActions();
}
```


Pass repatchReducer to you store as the reducer

```dart
var store = new Store<Counter, CounterBuilder, CounterActions>(
  repatchReducer<Counter, CounterBuilder>,
  new Counter(),
  new CounterActions(),
);
```

Dispatch the repatch

```dart
// increments count
store.actions.repatchDispatcher((s, b) => b.count++);
// decrements count
store.actions.repatchDispatcher((s, b) => b.count--);
```
