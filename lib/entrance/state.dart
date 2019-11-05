import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import '../model.dart';

class EntranceState implements Cloneable<EntranceState> {
  List<Model> shopList;
  ScrollController controller = new ScrollController();

  @override
  EntranceState clone() {
    return EntranceState()
      ..shopList = shopList
      ..controller = controller;
  }
}

EntranceState initState(Map<String, dynamic> args) {
  return EntranceState();
}
