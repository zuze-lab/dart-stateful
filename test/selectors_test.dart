import 'package:stateful/stateful.dart';
import 'package:test/test.dart';

class Entity {
  String a = 'a';
  String b = 'a';
  String c = 'a';
  String d = 'a';
  String e = 'a';
  String f = 'a';
  String g = 'a';
  String h = 'a';
  String i = 'a';
  String j = 'a';
  String k = 'a';
  String l = 'a';
}

var A = (Entity e) => e.a;
var B = (Entity e) => e.b;
var C = (Entity e) => e.c;
var D = (Entity e) => e.d;
var E = (Entity e) => e.e;
var F = (Entity e) => e.f;
var G = (Entity e) => e.g;
var H = (Entity e) => e.h;
var I = (Entity e) => e.i;
var J = (Entity e) => e.j;
var K = (Entity e) => e.k;
var L = (Entity e) => e.l;

void main() {
  group('Selectors', () {
    test('it should 0', () {
      final calls = [];

      var selector = Selector1<Entity, String, String>(
        A,
        (String v) {
          calls.add(v);
          return v;
        },
      );

      expect(selector(Entity()), equals('a'));
      expect(calls.length, equals(1));
      expect(calls, contains('a'));
      calls.clear();
      expect(selector(Entity()), equals('a'));
      expect(calls, isEmpty); // memoized!
      expect(selector(Entity()..a = 'b'), equals('b'));
      expect(calls, contains('b'));
    });

    test('it should 2', () {
      final calls = [];

      var selector = Selector2<Entity, String, String, String>(
        A,
        B,
        (String a, String b) {
          var v = '$a$b';
          calls.add(v);
          return v;
        },
      );

      expect(selector(Entity()), equals('aa'));
      expect(calls.length, equals(1));
      expect(calls, contains('aa'));
      calls.clear();
      expect(selector(Entity()), equals('aa'));
      expect(calls, isEmpty); // memoized!
      expect(selector(Entity()..a = 'b'), equals('ba'));
      expect(calls, contains('ba'));
      calls.clear();
      expect(selector(Entity()..b = 'b'), equals('ab'));
      expect(calls, contains('ab'));
      calls.clear();
      expect(
        selector(
          Entity()
            ..b = 'b' // same as last call
            ..c = 'b', // different, but not ed
        ),
        equals('ab'),
      );
      expect(calls, isEmpty); // memoized!
    });
  });
}
