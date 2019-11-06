import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SecondPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<SecondPageState>>{
      SecondPageAction.onAction: _onAction,
    },
  );
}

SecondPageState _onAction(SecondPageState state, Action action) {
  final SecondPageState toDo = action.payload;
  state.clone()
      ..title = toDo.title
      ..id    = toDo.id
      ..img   = toDo.img
      ..price = toDo.price
      ..protuct_img = toDo.protuct_img
      ..show  = toDo.show
      ..peisong = toDo.peisong
      ..is_collection = toDo.is_collection;

  return state;
}
