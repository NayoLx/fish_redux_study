import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class threePage extends Page<threeState, Map<String, dynamic>> {
  threePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<threeState>(
                adapter: null,
                slots: <String, Dependent<threeState>>{
                }),
            middleware: <Middleware<threeState>>[
            ],);

}
