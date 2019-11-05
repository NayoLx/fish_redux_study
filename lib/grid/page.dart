import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_fish_app/model.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class GridPage extends Page<GridState, Model> {
  GridPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<GridState>(
                adapter: null,
                slots: <String, Dependent<GridState>>{
                }),
            middleware: <Middleware<GridState>>[
            ],);

}
