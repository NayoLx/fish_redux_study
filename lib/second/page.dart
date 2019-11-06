import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';
import 'adapter/adapter.dart';

class SecondPage extends Page<SecondState,  Map<String, dynamic>> {
  SecondPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SecondState>(
                adapter: NoneConn<SecondState>() + SecondAdapter(),
                slots: <String, Dependent<SecondState>>{
                }),
            middleware: <Middleware<SecondState>>[
            ],);

}
