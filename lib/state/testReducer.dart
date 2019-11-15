import 'dart:convert';
import 'package:achievescape/state/freeDucks.dart';

import 'appState.dart';

class TestReducer implements Reducer {
  update(Quacktion action, AppState state) {

    AppState newState = state.makeCopy();

    switch(action.name) {
      case "stuff" :
        newState.count = state.count + 1;
    }

    return newState;
  }
}
