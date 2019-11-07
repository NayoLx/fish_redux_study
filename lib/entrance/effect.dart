import 'dart:convert';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import '../three/page.dart';
import '../event_bus.dart';
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
    EntranceAction.pageRouteBuild: _pageRouteBuild,
    Lifecycle.dispose: _dispose,
  });
}
void _dispose(Action action, Context<EntranceState> ctx) {
  (ctx.extra['eventBus'] as Function)();
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
void _onRouteToast(Action action, Context<EntranceState> ctx) async {
  await Navigator.push(
      ctx.context,
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return Center(
            child: GestureDetector(
              onTap: () {
                _onRouteTextToast(action, ctx);
              },
              child: Container(
                width: 350,
                height: 150,
                color: Colors.white,
                child: Center(
                  child: Text('点击修改价格'),
                ),
              ),
            ),
          );
        },
      ));
}

void _onRouteTextToast(Action action, Context<EntranceState> ctx) {
  TextEditingController textController = TextEditingController();

  Navigator.pushReplacement(
      ctx.context,
      PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) {
            return Center(
              child: Container(
                width: 350,
                height: 400,
                child: Material(
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: textController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '原本价格为${action.payload['price']}',
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            child: GestureDetector(
                              child: Text('取消'),
                              onTap: () => Navigator.of(ctx.context).pop(),
                            ),
                          ),
                          Container(
                            child: GestureDetector(
                              child: Text('修改'),
                              onTap: () {
                                Navigator.of(ctx.context).pop();
                                ctx.dispatch(EntranceActionCreator.onEditPrice(
                                    action.payload['id'],
                                    int.parse(textController.text)));
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }));
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

//弹窗修改
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
                  ctx.dispatch(EntranceActionCreator.onEditPrice(
                      action.payload['id'],
                      int.parse(usernameController.text)));
                },
              ),
            ),
          ],
        );
      });
}


void _pageRouteBuild(Action action, Context<EntranceState> ctx) {
  StreamSubscription<PageEvent> eventBus;

  eventBus = EventBusUtil.getInstance().on<PageEvent>().listen((data) {
    ctx.dispatch(EntranceActionCreator.editRouteBuild(data.test));
  });

  ctx.extra['eventBus'] = eventBus;

  Navigator.of(ctx.context).push(PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) {
        return Center(
          child: Container(
            width: 350,
            height: 100,
            decoration: new BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              border: new Border.all(width: 1, color: Colors.grey),
            ),
            child: threePage().buildPage(null),
          ),
        );
      })
  );
}