import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<GridState> buildReducer() {
  return asReducer(
    <Object, Reducer<GridState>>{
      GridAction.action: _onAction,
      GridAction.onEditAction: _onEditAction,
    },
  );
}

GridState _onAction(GridState state, Action action) {
  final newSomeState = action.payload;
  final GridState newState = state.clone();
  print(newSomeState);
  return newState;
}

GridState _onEditAction(GridState state, Action action) {
  return state.clone()
    ..is_collection = !state.is_collection;
}
