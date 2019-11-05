import 'dart:convert';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action; //注意1
import 'action.dart';
import 'state.dart';

Effect<EntranceState> buildEffect() {
  return combineEffects(<Object, Effect<EntranceState>>{
    Lifecycle.initState: _init, //页面初始化
    EntranceAction.action: _onAction,
    EntranceAction.openGrid: _onOpenGrid,
    EntranceAction.onRefreshUp: _onRefreshUp,
  });
}

void _onAction(Action action, Context<EntranceState> ctx) {}

void _onOpenGrid(Action action, Context<EntranceState> ctx) {
  print(action.payload);
  Navigator.of(ctx.context)
      .pushNamed(
      'grid_page',
      arguments: action.payload ,
      ).then((toValue) {
        ctx.dispatch(EntranceActionCreator.onEditAction(toValue));
  });
}

void _init(Action action, Context<EntranceState> ctx) {
  ctx.dispatch(EntranceActionCreator.onLoadData());
  _scrollController(action, ctx);
}

void _onRefreshUp(Action action, Context<EntranceState> ctx) async {
  await Future.delayed(Duration(seconds: 2), () {
    ctx.dispatch(EntranceActionCreator.onLoadData());
  });
}

void _scrollController(Action action, Context<EntranceState> ctx) {
  ctx.state.controller.addListener(() {
    print( ctx.state.controller.offset);
    if ( ctx.state.controller.position.pixels  ==  ctx.state.controller.position.maxScrollExtent) {
       print('滑动到了最底部');
       Future.delayed(Duration(seconds: 2), () {
         ctx.dispatch(EntranceActionCreator.onGetMoreData());
       });
    }
  });
}

