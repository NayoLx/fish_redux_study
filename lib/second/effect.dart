import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_fish_app/second/action.dart';
import 'state.dart';
import 'helper.dart';

Effect<SecondState> buildEffect() {
  return combineEffects(<Object, Effect<SecondState>>{
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<SecondState> ctx) async {
  await loadData(ctx);
  _scrollController(action, ctx);
}

void _scrollController(Action action, Context<SecondState> ctx) {
  ctx.state.controller.addListener(() {
    print( ctx.state.controller.offset);
    if ( ctx.state.controller.position.pixels  ==  ctx.state.controller.position.maxScrollExtent) {
      print('滑动到了最底部');
      Future.delayed(Duration(seconds: 2), () {
        ctx.dispatch(SecondActionCreator.onGetMoreData());
      });
    }
  });
}