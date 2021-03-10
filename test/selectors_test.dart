import 'package:stateful/stateful.dart';
import 'package:test/test.dart';

class Product {
  final int price;
  final String description;

  Product({
    required this.price,
    required this.description,
  });
}

class Cart {
  int taxRate;
  List<Product> products;
  DateTime? lastViewed;

  Cart({
    this.taxRate = 15,
    this.products = const [],
    this.lastViewed,
  });

  Cart clone() => Cart()
    ..taxRate = taxRate
    ..products = products;
}

void main() {
  group('Selectors', () {
    test('it should select0', () {
      final calls = [];

      final s = Stateful(
        Cart(products: [Product(price: 100, description: 'Chair')]),
      );

      // select the tax rate
      s.subscribe(
        Selector0<Cart, int, int>(
          (cart) => cart.taxRate,
          (v) {
            calls.add(v);
            return v;
          },
        ),
      );
      expect(calls, isNotEmpty);
      calls.clear();
      s.setState(
        patch: (cart) => cart
          ..products = [
            ...cart.products,
            Product(price: 200, description: 'Desk')
          ],
      );
      expect(calls, isEmpty);
      s.setState(patch: (cart) => cart..taxRate = 10);
      expect(calls, isNotEmpty);
    });

    test('it should select1', () {
      final calls = [];

      final s = Stateful(
        Cart(products: [Product(price: 100, description: 'Chair')]),
      );

      // create a selector total
      s.subscribe(
        Selector1<Cart, List<Product>, int, double>(
          (cart) => cart.products,
          (cart) => cart.taxRate,
          (products, taxRate) {
            // compute the total
            var total = products.fold<double>(
              0,
              (acc, p) => acc + (p.price * (taxRate / 100)),
            );
            calls.add(total);
            return total;
          },
        ),
      );
      expect(calls, isNotEmpty);
      calls.clear();
      s.setState(
        patch: (cart) => cart
          ..products = [
            ...cart.products,
            Product(price: 200, description: 'Desk')
          ],
      );
      expect(calls, isNotEmpty);
      calls.clear();
      s.setState(patch: (cart) => cart..taxRate = 10);
      expect(calls, isNotEmpty);
      calls.clear();
      s.setState(patch: (cart) => cart..lastViewed = DateTime.now());
      expect(calls, isEmpty);
    });
  });
}
