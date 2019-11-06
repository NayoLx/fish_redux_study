import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'component/component.dart';
import '../model.dart';


class SecondState implements Cloneable<SecondState> {
  List<SecondPageState> initList;
  ScrollController controller = new ScrollController();

  @override
  SecondState clone() {
    return SecondState()
    ..initList = initList
    ..controller = controller;
  }

}
SecondState initState(Map<String, dynamic> args) {
  return SecondState();
}
