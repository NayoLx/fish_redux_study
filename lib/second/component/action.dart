import 'package:fish_redux/fish_redux.dart';

import 'state.dart';

enum SecondPageAction { onAction }

class SecondPageActionCreator {
  static Action onAction(SecondPageState pageState) {
    return  Action (SecondPageAction.onAction, payload: pageState);
  }
}
