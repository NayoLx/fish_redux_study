import 'dart:convert';

import 'package:fish_redux/fish_redux.dart';
import '../model.dart';

class GridState implements Cloneable<GridState> {
  List<Model> shopList;
  int id;
  String img;
  String title;
  int price;
  String protuct_img;
  String show;
  String peisong;
  bool is_collection;

  @override
  GridState clone() {
    return GridState()
    ..shopList = shopList
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

GridState initState(Model args) {                   //数据类型要一致
  final GridState state = GridState();
  print(args?.is_collection);
  state.id = args?.id;
  state.title = args?.title;
  state.price =  args?.price;
  state.img =  args?.img;
  state.peisong =  args?.peisong;
  state.protuct_img =  args?.protuct_img;
  state.show =  args?.show;
  state.is_collection =  args?.is_collection;
  return state;
}
