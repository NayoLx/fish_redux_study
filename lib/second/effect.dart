import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<SecondState> buildEffect() {
  return combineEffects(<Object, Effect<SecondState>>{
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<SecondState> ctx) {
}
