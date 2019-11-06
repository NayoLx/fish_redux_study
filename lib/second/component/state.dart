import 'package:fish_redux/fish_redux.dart';
import 'package:meta/meta.dart';


class SecondPageState implements Cloneable<SecondPageState> {
  int id;
  String img;
  String title;
  int price;
  String protuct_img;
  String show;
  String peisong;
  bool is_collection;

  @override
  SecondPageState clone() {
    return SecondPageState()
      ..title = title
      ..id    = id
      ..img   = img
      ..price = price
      ..protuct_img = protuct_img
      ..show  = show
      ..peisong = peisong
      ..is_collection = is_collection;
  }


}
