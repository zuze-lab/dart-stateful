typedef StatefulListener<T> = void Function(T);
typedef StatefulPatch<T> = T Function(T);
typedef StatefulBatchCallback = Future? Function(Function);

class Stateful<T> {
  T _state;
  final Set<StatefulListener<T>> _subscribers = {};
  int _batchDepth = 0;

  void _notify() => _subscribers.forEach((s) => s(_state));

  void _done() {
    --_batchDepth;
    if (_batchDepth == 0) _notify();
  }

  Stateful(this._state);

  T getState() => _state;

  void setState({StatefulPatch<T>? patch, T? value}) {
    assert(
      patch != null || value != null,
      'One of a patch function or a value must be provided',
    );

    _state = value ?? patch!(_state);
    _notify();
  }

  void batch({StatefulBatchCallback? callback, Future? future}) {
    assert(
      callback != null || future != null,
      'One of callback or future must be provided',
    );
    ++_batchDepth;

    var out = (callback != null ? callback(_done) : future);
    out is Future ? out.whenComplete(_done) : null;
  }

  Function() addListener(StatefulListener<T> subscriber) {
    subscriber(_state);
    _subscribers.add(subscriber);
    return () => _subscribers.remove(subscriber);
  }
}
