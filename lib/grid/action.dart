import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum GridAction { action, onEditAction, back }

class GridActionCreator {
  static Action onAction() {
    return const Action(GridAction.action);
  }

  static Action onEditAction() {
    return Action (GridAction.onEditAction);
  }

  static Action backAction(bool is_collection, int id) {
    return Action (GridAction.back, payload: {'is_collection': is_collection, 'id': id});
  }
}

