import 'package:stateful/stateful.dart';
import 'package:test/test.dart';

void main() {
  group('Stateful', () {
    test('it should create a state', () {
      final s = Stateful('jim');
      expect(s.getState(), equals('jim'));
    });

    test('it should set state with a value', () {
      final s = Stateful('joe');
      expect(s.getState(), equals('joe'));
      s.setState(value: 'bill');
      expect(s.getState(), equals('bill'));
    });

    test('it should set state with a function', () {
      final s = Stateful('joe');
      expect(s.getState(), equals('joe'));
      s.setState(patch: (String current) => '$current bill');
      expect(s.getState(), equals('joe bill'));
    });

    test('it should subscribe', () {
      final s = Stateful('bill');
      final calls = [];
      var subscriber = (String v) => calls.add(v);
      s.addListener(subscriber);
      expect(calls, hasLength(1));
      expect(calls[0], equals('bill'));
      calls.clear();
      s.setState(value: 'jim');
      expect(calls, hasLength(1));
      expect(calls[0], equals('jim'));
    });

    test('it should unsubscribe', () {
      final s = Stateful('bill');
      final calls = [];
      var subscriber = (String v) => calls.add(v);
      final unsub = s.addListener(subscriber);
      calls.clear();
      unsub();
      s.setState(value: 'joe');
      expect(calls, hasLength(0));
    });
  });
}
