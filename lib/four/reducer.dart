import 'package:fish_redux/fish_redux.dart';

import '../event_bus.dart';
import 'action.dart';
import 'state.dart';


Reducer<fourState> buildReducer() {
  return asReducer(
    <Object, Reducer<fourState>>{
      fourAction.onAction: _onAction,
      fourAction.onPopValue: _onPopValue,
    },
  );
}

fourState _onAction(fourState state, Action action) {
  final fourState newState = state.clone();
  return newState;
}

fourState _onPopValue(fourState state, Action action) {
  EventBusUtil.getInstance().fire(PageEvent(action.payload));
}