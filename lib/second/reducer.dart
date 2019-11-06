import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_fish_app/api.dart';
import 'package:flutter_fish_app/second/component/state.dart';

import 'action.dart';
import 'state.dart';

Reducer<SecondState> buildReducer() {
  return asReducer(
    <Object, Reducer<SecondState>>{
      SecondAction.onAcion: _onAction,
      SecondAction.initInitList: _initInitList,
    },
  );
}

SecondState _onAction(SecondState state, Action action) {
  final SecondState newState = state.clone();
  return newState;
}

SecondState _initInitList(SecondState state, Action action) {
  final List<SecondPageState> initList = action.payload ?? <SecondPageState>[];
  final SecondState newState = state.clone();
  newState.initList = initList;
  return newState;
}

