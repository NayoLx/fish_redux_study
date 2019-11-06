import 'package:fish_redux/fish_redux.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';
export 'state.dart';

class SecondPageComponent extends Component<SecondPageState>  {
  SecondPageComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SecondPageState>(
                adapter: null,
                slots: <String, Dependent<SecondPageState>>{
                }),);

}
