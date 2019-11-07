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
  showToast,
  onEditPrice,
  onRouteToast,
  pageRouteBuild,
  editRouteBuild,
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

  //显示弹窗
  static Action showToast(int id, int price) {
    return Action(EntranceAction.showToast, payload: {'id': id, 'price': price});
  }

  //修改数据
  static Action onEditPrice(int id, int price) {
    return Action(EntranceAction.onEditPrice, payload: {'id': id, 'price': price});
  }

  //路由弹窗
  static Action onRouteToast(int id, int price) {
    return Action(EntranceAction.onRouteToast,  payload: {'id': id, 'price': price});
  }
  
  //页面跳转
  static Action toSecondPage() {
    return Action(EntranceAction.toSecondPage);
  }


  //popRoute页面路由实现
  static Action pageRouteBuild() {
    return Action(EntranceAction.pageRouteBuild);
  }

  static Action editRouteBuild(String test) {
    return Action(EntranceAction.editRouteBuild, payload: test);

  }

}
