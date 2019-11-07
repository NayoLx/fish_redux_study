import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';


// threeActionCreator
Widget buildView(threeState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 20),
          child: Center(
//              child: Text('${eventData}' == ''|| '${eventData}' == null ? '' : '${eventData}'),
          ),
        ),
        FlatButton(
          onPressed: () {
              dispatch(threeActionCreator.toFourPage());
          },
          child: Text('点我进入下一页'),
        ),
      ],
    ),
  );
}
