import 'package:fish_redux/fish_redux.dart';

import 'state.dart';

enum threeAction { onAction, toFourPage }

class threeActionCreator {
  static Action onAction() {
    return  Action (threeAction.onAction);
  }

  static Action toFourPage() {
    return Action (threeAction.toFourPage);
  }
}
