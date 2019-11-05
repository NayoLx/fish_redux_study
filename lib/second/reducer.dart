import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SecondState> buildReducer() {
  return asReducer(
    <Object, Reducer<SecondState>>{
      SecondAction.onAcion: _onAction,
    },
  );
}

SecondState _onAction(SecondState state, Action action) {
  final SecondState newState = state.clone();
  return newState;
}
