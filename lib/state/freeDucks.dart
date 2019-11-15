import 'dart:convert';
import 'appState.dart';

class Quacktion {
  String name;
  dynamic data;

  Quacktion({this.name, this.data});
}

class Reducer {
  AppState update(Quacktion action, AppState state) {return new AppState();}
}

class Effect {
  void fire(Quacktion action, AppState state) {}
}

class FreeDucks {
  AppState _state;
  List<Reducer> _reducers;
  List<Effect> _effects;
  List<Function> _subscriptions;

  FreeDucks(){
    _state = new AppState(count: 0);
    _reducers = [];
    _effects = [];
    _subscriptions = [];
  }

  dispatch(Quacktion action) {
    _reducers.forEach((reducer) => {
      _state = reducer.update(action, _state)
    });

    _effects.forEach((effect) => {
      effect.fire(action, _state.makeCopy())
    });

    final updatedState = _state.makeCopy();
    _updateSubscriptions(updatedState);
  }

  _updateSubscriptions(AppState newState) {
    _subscriptions.forEach((subscription) => {
      subscription(newState)
    });
  }

  subscribe(Function callback) {
    _subscriptions.add(callback);
   // callback(_getCopyOfState);
  }

  registerReducer(Reducer reducer) {
    _reducers.add(reducer);
  }
}

FreeDucks freeDucks = new FreeDucks();
