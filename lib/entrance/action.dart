import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_fish_app/model.dart';
import 'state.dart';

//TODO replace with your own action
enum EntranceAction {
  action,
  openGrid,
  loadData,
  onRefreshUp,
  onGetMoreData,
  onEditAction,
  toSecondPage,
}

class EntranceActionCreator {
  static Action onAction() {
    return const Action(EntranceAction.action);
  }

  //加载数据
  static Action onLoadData() {
    return Action(EntranceAction.loadData);
  }

  //打开第二个页面
  static Action onOpenGrid(Model i) {
    return Action(EntranceAction.openGrid, payload: i); //传参
  }

  //刷新
  static Action onRefreshUp() {
    return Action(EntranceAction.onRefreshUp);
  }

  //获取更多数据
  static Action onGetMoreData() {
    return Action(EntranceAction.onGetMoreData);
  }

  //交互
  static Action onEditAction(Object toValue) {
    return Action(EntranceAction.onEditAction, payload: toValue);
  }

  static Action toSecondPage() {
    return Action(EntranceAction.toSecondPage);
  }

}
