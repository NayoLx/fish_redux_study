import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import '../event_bus.dart';
import 'action.dart';
import 'state.dart';

Effect<fourState> buildEffect() {
  return combineEffects(<Object, Effect<fourState>>{
    Lifecycle.initState: _initState,
    fourAction.popBack: _popBack,
  });
}

void _initState(Action action, Context<fourState> ctx) {
}


void _popBack(Action action, Context<fourState> ctx) {
  Navigator.of(ctx.context).pop();
  ctx.dispatch(fourActionCreator.onPopValue(action.payload));
}