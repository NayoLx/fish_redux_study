import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';


// fourActionCreator
Widget buildView(fourState state, Dispatch dispatch, ViewService viewService) {
  TextEditingController textController = new TextEditingController();
  return Scaffold(
      body: Container(
          padding: EdgeInsets.only(bottom: 25),
          child: Column(
            children: <Widget>[
              TextField(
                controller: textController,
              ),
              FlatButton(
                onPressed: () {
                    dispatch(fourActionCreator.popBack(textController.text));
                },
                child: Text('传值'),
              ),
            ],
          )
      )
  );
}
