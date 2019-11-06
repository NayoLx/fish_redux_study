import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<SecondPageState> buildEffect() {
  return combineEffects(<Object, Effect<SecondPageState>>{
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<SecondPageState> ctx) {
}

