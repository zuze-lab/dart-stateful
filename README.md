A tiny state management library for Dart developers.

## Usage

A simple usage example:

```dart
import 'package:stateful/stateful.dart';

main() {
  var state = Stateful('joe');
  print(state.getState()); // prints joe

  var subscriber = (String state) => print('Subscriber says $state');
  var unsub = state.subscribe(subscriber); // prints Subscriber says joe;
  state.setState('bill'); // prints Subscriber says bill;
  unsub(); // unsubscribe
  state.setState('bob'); // doesn't print
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://github.com/zuze-lab/dart-stateful/issues
