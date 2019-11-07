import 'package:fish_redux/fish_redux.dart';


class threeState implements Cloneable<threeState> {
  int id;
  int price;

  @override
  threeState clone() {
    return threeState()
      ..id = id
      ..price = price;
  }

}

threeState initState(Map<String, dynamic> arg) {
  return threeState();
}
