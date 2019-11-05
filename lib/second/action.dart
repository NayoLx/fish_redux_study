import 'package:fish_redux/fish_redux.dart';
import 'state.dart';

enum SecondAction { onAcion }

class SecondActionCreator {
  static Action onAcion() {
    return  Action(SecondAction.onAcion);
  }
}
