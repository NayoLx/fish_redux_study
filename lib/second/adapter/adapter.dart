import 'package:fish_redux/fish_redux.dart';
import '../component/component.dart';
import '../state.dart';

class SecondAdapter extends DynamicFlowAdapter<SecondState> {
  SecondAdapter()
      : super(
          pool: <String, Component<Object>>{
            'secondPage': SecondPageComponent(),
          },
          connector: _SecondConnector(),
        );
}

class _SecondConnector extends ConnOp<SecondState, List<ItemBean>> {
  @override
  List<ItemBean> get(SecondState state) {
    List<ItemBean> itemBeans = state.initList
        ?.map<ItemBean>((value) => ItemBean("secondPage", value))
        ?.toList();
    return itemBeans ?? [];
  }

  @override
  void set(SecondState state, List<ItemBean> items) {}
}
