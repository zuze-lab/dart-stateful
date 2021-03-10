typedef Comparator = bool Function(dynamic, dynamic);

var _DEFAULT_COMPARATOR = (a, b) => a == b;

bool _check(List lastResults, List next, [Comparator? comparator]) =>
    lastResults.isEmpty ||
    !lastResults.asMap().entries.every(
          (e) => (comparator ?? _DEFAULT_COMPARATOR)(
            next[e.key],
            e.value,
          ),
        );

Z Function(A) Selector0<A, B, Z>(
  B Function(A) selectorA,
  Z Function(B) combiner, {
  Comparator? comparator,
}) {
  var lastResult;
  var lastResults = [];

  return (A state) {
    var a = selectorA(state);
    var next = [a];
    if (_check(lastResults, next)) lastResult = combiner(a);
    lastResults = next;
    return lastResult;
  };
}

Z Function(A) Selector1<A, B, C, Z>(
  B Function(A) selectorA,
  C Function(A) selectorB,
  Z Function(B, C) combiner, {
  Comparator? comparator,
}) {
  var lastResult;
  var lastResults = [];

  return (A state) {
    var a = selectorA(state);
    var b = selectorB(state);
    var next = [a, b];
    var shouldCall = _check(lastResults, next);
    if (shouldCall) lastResult = combiner(a, b);
    lastResults = next;
    return lastResult;
  };
}

Z Function(A) Selector2<A, B, C, D, Z>(
    B Function(A) selectorA,
    C Function(A) selectorB,
    D Function(A) selectorC,
    Z Function(B, C, D) combiner,
    {Comparator? comparator}) {
  var lastResult;
  var lastResults = [];

  return (A state) {
    var a = selectorA(state);
    var b = selectorB(state);
    var c = selectorC(state);
    var next = [a, b, c];
    if (_check(lastResults, next)) lastResult = combiner(a, b, c);
    lastResults = next;
    return lastResult!;
  };
}

Z Function(A) Selector3<A, B, C, D, E, Z>(
    B Function(A) selectorA,
    C Function(A) selectorB,
    D Function(A) selectorC,
    E Function(A) selectorD,
    Z Function(B, C, D, E) combiner,
    {Comparator? comparator}) {
  var lastResult;
  var lastResults = [];

  return (A state) {
    var a = selectorA(state);
    var b = selectorB(state);
    var c = selectorC(state);
    var d = selectorD(state);
    var next = [a, b, c, d];
    if (_check(lastResults, next)) lastResult = combiner(a, b, c, d);
    lastResults = next;
    return lastResult;
  };
}

Z Function(A) Selector4<A, B, C, D, E, F, Z>(
    B Function(A) selectorA,
    C Function(A) selectorB,
    D Function(A) selectorC,
    E Function(A) selectorD,
    F Function(A) selectorE,
    Z Function(B, C, D, E, F) combiner,
    {Comparator? comparator}) {
  var lastResult;
  var lastResults = [];

  return (A state) {
    var a = selectorA(state);
    var b = selectorB(state);
    var c = selectorC(state);
    var d = selectorD(state);
    var e = selectorE(state);
    var next = [a, b, c, d];
    if (_check(lastResults, next)) lastResult = combiner(a, b, c, d, e);
    lastResults = next;
    return lastResult;
  };
}
