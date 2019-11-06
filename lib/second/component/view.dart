import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'state.dart';

// SecondPageActionCreator
Widget buildView(SecondPageState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    child: new GestureDetector(
      child: Column(children: <Widget>[
        new Row(children: <Widget>[
          new Container(
            child: new Image(
              image: AssetImage('${state.img}'),
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            width: 150,
            height: 150,
            padding: new EdgeInsets.only(top: 10, bottom: 10),
            margin: new EdgeInsets.only(right: 10, left: 10),
          ),
          new Column(children: <Widget>[
            new Row(
              children: <Widget>[
                new Container(
                  padding: new EdgeInsets.only(right: 10),
                  child: new Text(
                    '${state.title}',
                    style: new TextStyle(fontSize: 18),
                  ),
                ),
                new Text('￥${state.price}'),
              ],
            ),
            new Row(
              children: <Widget>[
                new Container(
                  padding: new EdgeInsets.only(
                      top: 10, bottom: 10, right: 5, left: 5),
                  child: new Text(
                    '当日午餐',
                    style: new TextStyle(color: Color.fromARGB(100, 0, 0, 128)),
                  ),
                ),
                new Container(
                  padding: new EdgeInsets.only(
                      top: 10, bottom: 10, right: 5, left: 5),
                  child: new Text('当日晚餐',
                      style: new TextStyle(
                          color: Color.fromRGBO(96, 96, 96, 0.5))),
                ),
                new Container(
                  padding: new EdgeInsets.only(
                      top: 10, bottom: 10, right: 5, left: 5),
                  child: new Text('当日夜宵',
                      style: new TextStyle(
                          color: Color.fromRGBO(96, 96, 96, 0.5))),
                ),
              ],
            ),
            new Container(
              padding: new EdgeInsets.only(bottom: 10),
              child: new GestureDetector(
                child: new Text('${state.is_collection}' == 'true' ? '已收藏': '收藏'),
              ),
            ),
            new Row(
              children: <Widget>[
                new Container(
                  padding: new EdgeInsets.only(right: 20),
                  child: new Text(
                    '用礼金兑换',
                    style: new TextStyle(color: Colors.redAccent),
                  ),
                ),
                new Container(
                  child: new Text(
                    '送给TA',
                    style: new TextStyle(color: Colors.white),
                  ),
                  alignment: Alignment(0, 0),
                  color: Colors.pink,
                  width: 50,
                  height: 25,
                ),
              ],
            ),
          ])
        ])
      ]),
    ),
  );
}
