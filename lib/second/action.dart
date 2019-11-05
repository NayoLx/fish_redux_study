import 'package:fish_redux/fish_redux.dart';

import 'state.dart';

enum SecondAction { modify }

class SecondActionCreator {
  static Action modify(void Function(SecondState clone) modifyFunc) {
    return  Action (SecondAction.modify,payload: modifyFunc);
  }
}
