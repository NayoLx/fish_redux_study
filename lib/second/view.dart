import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';


// SecondActionCreator
Widget buildView(SecondState state, Dispatch dispatch, ViewService viewService) {
  final adapter = viewService.buildAdapter();
  return Scaffold(
    appBar: AppBar(
      title: Text('List View学习'),
    ),
    body: Container(
        child: RefreshIndicator(
          child: ListView.builder(
            itemBuilder: null,
            itemCount: 0,
          ),
        ),
    ),
  );
}
