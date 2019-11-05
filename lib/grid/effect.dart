import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action; //注意1
import 'action.dart';
import 'state.dart';

Effect<GridState> buildEffect() {
  return combineEffects(<Object, Effect<GridState>>{
    GridAction.action: _onAction,
    GridAction.back: _back,
  });
}

void _onAction(Action action, Context<GridState> ctx) {
}

void _back(Action action, Context<GridState> ctx) {
    Navigator.of(ctx.context).pop( action.payload );      //传参数回去
}