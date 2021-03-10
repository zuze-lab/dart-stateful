typedef Comparator = bool Function(dynamic, dynamic);

var _DEFAULT_COMPARATOR = (a, b) => a == b;

B Function(A) _inner<A, B>(List<Function(A)> dependencies, Function combiner,
    [Comparator? comparator]) {
  var lastResult;
  var lastResults = [];
  return (A state) {
    var next = dependencies.map((e) => e(state)).toList();
    if (_check(lastResults, next, comparator)) {
      switch (next.length) {
        case 1:
          lastResult = combiner(
            next[0],
          );
          break;
        case 2:
          lastResult = combiner(
            next[0],
            next[1],
          );
          break;
        case 3:
          lastResult = combiner(
            next[0],
            next[1],
            next[2],
          );
          break;
        case 4:
          lastResult = combiner(
            next[0],
            next[1],
            next[2],
            next[3],
          );
          break;
        case 5:
          lastResult = combiner(
            next[0],
            next[1],
            next[2],
            next[4],
          );
          break;
        case 6:
          lastResult = combiner(
            next[0],
            next[1],
            next[2],
            next[4],
            next[5],
          );
          break;
        case 7:
          lastResult = combiner(
            next[0],
            next[1],
            next[2],
            next[4],
            next[5],
            next[6],
          );
          break;
        case 8:
          lastResult = combiner(
            next[0],
            next[1],
            next[2],
            next[4],
            next[5],
            next[6],
            next[7],
          );
          break;
        case 9:
          lastResult = combiner(
            next[0],
            next[1],
            next[2],
            next[4],
            next[5],
            next[6],
            next[7],
            next[8],
          );
          break;
        case 10:
          lastResult = combiner(
            next[0],
            next[1],
            next[2],
            next[4],
            next[5],
            next[6],
            next[7],
            next[8],
            next[9],
          );
          break;
        case 11:
          lastResult = combiner(
            next[0],
            next[1],
            next[2],
            next[4],
            next[5],
            next[6],
            next[7],
            next[8],
            next[9],
            next[10],
          );
          break;
        case 12:
          lastResult = combiner(
            next[0],
            next[1],
            next[2],
            next[4],
            next[5],
            next[6],
            next[7],
            next[8],
            next[9],
            next[10],
            next[11],
          );
          break;
        case 13:
          lastResult = combiner(
            next[0],
            next[1],
            next[2],
            next[4],
            next[5],
            next[6],
            next[7],
            next[8],
            next[9],
            next[10],
            next[11],
            next[12],
          );
          break;
      }
    }
    lastResults = next;
    return lastResult;
  };
}

bool _check(List lastResults, List next, [Comparator? comparator]) =>
    lastResults.isEmpty ||
    !lastResults.asMap().entries.every(
          (e) => (comparator ?? _DEFAULT_COMPARATOR)(
            next[e.key],
            e.value,
          ),
        );

Z Function(Y) Selector1<Y, A, Z>(
  A Function(Y) selectorA,
  Z Function(A) combiner, {
  Comparator? comparator,
}) =>
    _inner<Y, Z>(
      [
        selectorA,
      ],
      combiner,
      comparator,
    );

Z Function(Y) Selector2<Y, A, B, Z>(
  A Function(Y) selectorA,
  B Function(Y) selectorB,
  Z Function(A, B) combiner, {
  Comparator? comparator,
}) =>
    _inner<Y, Z>(
      [
        selectorA,
        selectorB,
      ],
      combiner,
      comparator,
    );

Z Function(Y) Selector3<Y, A, B, C, Z>(
  A Function(Y) selectorA,
  B Function(Y) selectorB,
  C Function(Y) selectorC,
  Z Function(A, B, C) combiner, {
  Comparator? comparator,
}) =>
    _inner<Y, Z>(
      [
        selectorA,
        selectorB,
        selectorC,
      ],
      combiner,
      comparator,
    );

Z Function(Y) Selector4<Y, A, B, C, D, Z>(
  A Function(Y) selectorA,
  B Function(Y) selectorB,
  C Function(Y) selectorC,
  D Function(Y) selectorD,
  Z Function(A, B, C, D) combiner, {
  Comparator? comparator,
}) =>
    _inner<Y, Z>(
      [
        selectorA,
        selectorB,
        selectorC,
        selectorD,
      ],
      combiner,
      comparator,
    );

Z Function(Y) Selector5<Y, A, B, C, D, E, Z>(
  A Function(Y) selectorA,
  B Function(Y) selectorB,
  C Function(Y) selectorC,
  D Function(Y) selectorD,
  E Function(Y) selectorE,
  Z Function(A, B, C, D, E) combiner, {
  Comparator? comparator,
}) =>
    _inner<Y, Z>(
      [
        selectorA,
        selectorB,
        selectorC,
        selectorD,
        selectorE,
      ],
      combiner,
      comparator,
    );

Z Function(Y) Selector6<Y, A, B, C, D, E, F, Z>(
  A Function(Y) selectorA,
  B Function(Y) selectorB,
  C Function(Y) selectorC,
  D Function(Y) selectorD,
  E Function(Y) selectorE,
  F Function(Y) selectorF,
  Z Function(A, B, C, D, E, F) combiner, {
  Comparator? comparator,
}) =>
    _inner<Y, Z>(
      [
        selectorA,
        selectorB,
        selectorC,
        selectorD,
        selectorE,
        selectorF,
      ],
      combiner,
      comparator,
    );

Z Function(Y) Selector7<Y, A, B, C, D, E, F, G, Z>(
  A Function(Y) selectorA,
  B Function(Y) selectorB,
  C Function(Y) selectorC,
  D Function(Y) selectorD,
  E Function(Y) selectorE,
  F Function(Y) selectorF,
  G Function(Y) selectorG,
  Z Function(A, B, C, D, E, F, G) combiner, {
  Comparator? comparator,
}) =>
    _inner<Y, Z>(
      [
        selectorA,
        selectorB,
        selectorC,
        selectorD,
        selectorE,
        selectorF,
        selectorG,
      ],
      combiner,
      comparator,
    );

Z Function(Y) Selector8<Y, A, B, C, D, E, F, G, H, Z>(
  A Function(Y) selectorA,
  B Function(Y) selectorB,
  C Function(Y) selectorC,
  D Function(Y) selectorD,
  E Function(Y) selectorE,
  F Function(Y) selectorF,
  G Function(Y) selectorG,
  H Function(Y) selectorH,
  Z Function(A, B, C, D, E, F, G, H) combiner, {
  Comparator? comparator,
}) =>
    _inner<Y, Z>(
      [
        selectorA,
        selectorB,
        selectorC,
        selectorD,
        selectorE,
        selectorF,
        selectorG,
        selectorH,
      ],
      combiner,
      comparator,
    );

Z Function(Y) Selector9<Y, A, B, C, D, E, F, G, H, I, Z>(
  A Function(Y) selectorA,
  B Function(Y) selectorB,
  C Function(Y) selectorC,
  D Function(Y) selectorD,
  E Function(Y) selectorE,
  F Function(Y) selectorF,
  G Function(Y) selectorG,
  H Function(Y) selectorH,
  I Function(Y) selectorI,
  Z Function(A, B, C, D, E, F, G, H, I) combiner, {
  Comparator? comparator,
}) =>
    _inner<Y, Z>(
      [
        selectorA,
        selectorB,
        selectorC,
        selectorD,
        selectorE,
        selectorF,
        selectorG,
        selectorH,
        selectorI,
      ],
      combiner,
      comparator,
    );

Z Function(Y) Selector10<Y, A, B, C, D, E, F, G, H, I, J, Z>(
  A Function(Y) selectorA,
  B Function(Y) selectorB,
  C Function(Y) selectorC,
  D Function(Y) selectorD,
  E Function(Y) selectorE,
  F Function(Y) selectorF,
  G Function(Y) selectorG,
  H Function(Y) selectorH,
  I Function(Y) selectorI,
  J Function(Y) selectorJ,
  Z Function(A, B, C, D, E, F, G, H, I, J) combiner, {
  Comparator? comparator,
}) =>
    _inner<Y, Z>(
      [
        selectorA,
        selectorB,
        selectorC,
        selectorD,
        selectorE,
        selectorF,
        selectorG,
        selectorH,
        selectorI,
        selectorJ,
      ],
      combiner,
      comparator,
    );

Z Function(Y) Selector11<Y, A, B, C, D, E, F, G, H, I, J, K, Z>(
  A Function(Y) selectorA,
  B Function(Y) selectorB,
  C Function(Y) selectorC,
  D Function(Y) selectorD,
  E Function(Y) selectorE,
  F Function(Y) selectorF,
  G Function(Y) selectorG,
  H Function(Y) selectorH,
  I Function(Y) selectorI,
  J Function(Y) selectorJ,
  K Function(Y) selectorK,
  Z Function(A, B, C, D, E, F, G, H, I, J, K) combiner, {
  Comparator? comparator,
}) =>
    _inner<Y, Z>(
      [
        selectorA,
        selectorB,
        selectorC,
        selectorD,
        selectorE,
        selectorF,
        selectorG,
        selectorH,
        selectorI,
        selectorJ,
        selectorK,
      ],
      combiner,
      comparator,
    );

Z Function(Y) Selector12<Y, A, B, C, D, E, F, G, H, I, J, K, L, Z>(
  A Function(Y) selectorA,
  B Function(Y) selectorB,
  C Function(Y) selectorC,
  D Function(Y) selectorD,
  E Function(Y) selectorE,
  F Function(Y) selectorF,
  G Function(Y) selectorG,
  H Function(Y) selectorH,
  I Function(Y) selectorI,
  J Function(Y) selectorJ,
  K Function(Y) selectorK,
  L Function(Y) selectorL,
  Z Function(A, B, C, D, E, F, G, H, I, J, K, L) combiner, {
  Comparator? comparator,
}) =>
    _inner<Y, Z>(
      [
        selectorA,
        selectorB,
        selectorC,
        selectorD,
        selectorE,
        selectorF,
        selectorG,
        selectorH,
        selectorI,
        selectorJ,
        selectorK,
        selectorL,
      ],
      combiner,
      comparator,
    );

Z Function(Y) Selector13<Y, A, B, C, D, E, F, G, H, I, J, K, L, M, Z>(
  A Function(Y) selectorA,
  B Function(Y) selectorB,
  C Function(Y) selectorC,
  D Function(Y) selectorD,
  E Function(Y) selectorE,
  F Function(Y) selectorF,
  G Function(Y) selectorG,
  H Function(Y) selectorH,
  I Function(Y) selectorI,
  J Function(Y) selectorJ,
  K Function(Y) selectorK,
  L Function(Y) selectorL,
  M Function(Y) selectorM,
  Z Function(A, B, C, D, E, F, G, H, I, J, K, L, M) combiner, {
  Comparator? comparator,
}) =>
    _inner<Y, Z>(
      [
        selectorA,
        selectorB,
        selectorC,
        selectorD,
        selectorE,
        selectorF,
        selectorG,
        selectorH,
        selectorI,
        selectorJ,
        selectorK,
        selectorL,
        selectorM,
      ],
      combiner,
      comparator,
    );
