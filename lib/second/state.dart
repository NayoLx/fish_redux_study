import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class SecondState implements Cloneable<SecondState> {


  @override
  SecondState clone() {
    return SecondState();
  }

}
SecondState initState(Map<String, dynamic> args) {
  return SecondState();
}
