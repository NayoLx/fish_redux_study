import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class fourPage extends Page<fourState, Map<String, dynamic>> {
  fourPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<fourState>(
                adapter: null,
                slots: <String, Dependent<fourState>>{
                }),
            middleware: <Middleware<fourState>>[
            ],);

}
