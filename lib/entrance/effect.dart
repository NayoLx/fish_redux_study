import 'dart:convert';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<EntranceState> buildEffect() {
  return combineEffects(<Object, Effect<EntranceState>>{
    Lifecycle.initState: _init, //页面初始化
    EntranceAction.action: _onAction,
    EntranceAction.openGrid: _onOpenGrid,
    EntranceAction.onRefreshUp: _onRefreshUp,
    EntranceAction.toSecondPage: _toSecondPage,
    EntranceAction.showToast: _showToast,
    EntranceAction.onRouteToast: _onRouteToast,
  });
}

void _onAction(Action action, Context<EntranceState> ctx) {}

void _onOpenGrid(Action action, Context<EntranceState> ctx) {
  Navigator.of(ctx.context)
      .pushNamed(
    'grid_page',
    arguments: action.payload,
  )
      .then((toValue) {
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
    print(ctx.state.controller.offset);
    if (ctx.state.controller.position.pixels ==
        ctx.state.controller.position.maxScrollExtent) {
      print('滑动到了最底部');
      Future.delayed(Duration(seconds: 2), () {
        ctx.dispatch(EntranceActionCreator.onGetMoreData());
      });
    }
  });
}

void _toSecondPage(Action action, Context<EntranceState> ctx) {
  Navigator.of(ctx.context).pushNamed('second_page', arguments: null);
}


//路由弹窗
void _onRouteToast(Action action, Context<EntranceState> ctx) {

}

//弹窗
void _showToast(Action action, Context<EntranceState> ctx) async {
  await showDialog<String>(
      context: ctx.context,
      builder: (build) {
        return GestureDetector(
          child: AlertDialog(
            title: Text('点击修改价格'),
          ),
          onTap: () {
            Navigator.of(ctx.context).pop();
            _showTextToast(action, ctx);
          },
        );
      });
}

void _showTextToast(Action action, Context<EntranceState> ctx) async {
  TextEditingController usernameController = TextEditingController();

  await showDialog<String>(
      context: ctx.context,
      builder: (build) {
        return AlertDialog(
          title: TextField(
            controller: usernameController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: '原本价格为${action.payload['price']}',
            ),
          ),
          actions: <Widget>[
            GestureDetector(
              child: Text('取消'),
              onTap: () => Navigator.of(ctx.context).pop(),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
              child: GestureDetector(
                child: Text('修改'),
                onTap: () {
                  Navigator.of(ctx.context).pop();
                  ctx.dispatch(EntranceActionCreator.onEditPrice(action.payload['id'], int.parse(usernameController.text)));
                },
              ),
            ),
          ],
        );
      });
}
