import 'package:fish_redux/fish_redux.dart';
import 'component/component.dart';
import 'state.dart';

enum SecondAction { onAcion, initInitList, onRefreshUp, onGetMoreData }

class SecondActionCreator {
  static Action onAcion() {
    return  Action(SecondAction.onAcion);
  }

  static Action initInitList(List<SecondPageState> initList) {
    return  Action(SecondAction.initInitList, payload: initList);
  }

  //刷新
  static Action onRefreshUp() {
    print('onRefresh');
    return Action(SecondAction.onRefreshUp);
  }

  //获取更多数据
  static Action onGetMoreData() {
    print('onGetMoreData');
    return Action(SecondAction.onGetMoreData);
  }

}
