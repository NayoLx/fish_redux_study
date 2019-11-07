import 'package:fish_redux/fish_redux.dart';

import 'state.dart';

enum fourAction { onAction, popBack, onPopValue }

class fourActionCreator {
  static Action onAction() {
    return  Action (fourAction.onAction);
  }

  static Action popBack(String test) {
    return Action (fourAction.popBack, payload: test);
  }

  static Action onPopValue(String test) {
    return Action (fourAction.onPopValue, payload: test);
  }
}
