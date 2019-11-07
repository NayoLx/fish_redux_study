import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<threeState> buildReducer() {
  return asReducer(
    <Object, Reducer<threeState>>{
      threeAction.onAction: _onAction,
    },
  );
}

threeState _onAction(threeState state, Action action) {
  final threeState newState = state.clone();
  return newState;
}