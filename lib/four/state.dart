import 'package:fish_redux/fish_redux.dart';

class fourState implements Cloneable<fourState> {
  int id;
  int price;

  @override
  fourState clone() {
    return fourState()
      ..id = id
      ..price = price;
  }
}

fourState initState(Map<String, dynamic> arg) {
  return fourState();
}
