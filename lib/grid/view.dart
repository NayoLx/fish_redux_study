import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(GridState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: new AppBar(
      title: new Text('Grid页面'),
    ),
    body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Column(
          children: <Widget>[
            new Row(
                children: <Widget>[
                  new Container(
                    padding: new EdgeInsets.only(right: 20),
                    child: new Image(
                      image: AssetImage(state.img),
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                  new Column(
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            new Container(
                              padding: new EdgeInsets.only(right: 15),
                              child: new Text(
                                '单价',
                                style: new TextStyle(
                                    fontSize: 20,
                                    color: Color.fromRGBO(255, 0, 0, 1)
                                ),
                              ),
                            ),
                            new Container(
                              child: new Text(
                                '￥${state.price}',
                                style: new TextStyle(
                                    fontSize: 20,
                                    color: Color.fromRGBO(255, 0, 0, 1)
                                ),),
                              padding: new EdgeInsets.only(right: 20),
                            ),
                            new GestureDetector(
                              child: new Container(
                                child: new Icon(
                                  state.is_collection ? Icons.favorite : Icons.favorite_border,
                                  color: state.is_collection ? Colors.red : null,
                                ),
                              ),
                              onTap: () {
                                dispatch(GridActionCreator.onEditAction());
                              },
                            ),
                          ],
                        ),
                        new Container(
                          child: new Text('配送范围：${state.peisong}米', style: new TextStyle(fontSize: 15),),
                          padding: new EdgeInsets.only(top: 15, bottom: 20),
                        ),
                        new Row(
                          children: <Widget>[
                            new Container(
                              padding: new EdgeInsets.only(bottom: 10, right: 5, left: 5),
                              child:  new Text('当日午餐',
                                style: new TextStyle(
                                    color: Color.fromARGB(100, 0, 0, 128)
                                ),
                              ),
                            ),
                            new Container(
                              padding: new EdgeInsets.only(bottom: 10, right: 5, left: 5),
                              child: new Text('当日晚餐',
                                  style: new TextStyle(
                                      color: Color.fromRGBO(96, 96, 96, 0.5)
                                  )
                              ),
                            ),
                            new Container(
                              padding: new EdgeInsets.only( bottom: 10, right: 5, left: 5),
                              child: new Text('当日夜宵',
                                  style: new TextStyle(
                                      color: Color.fromRGBO(96, 96, 96, 0.5)
                                  )
                              ),
                            ),
                          ],
                        ),
                      ]
                  )
                ]
            ),
            new Container(
              padding: new EdgeInsets.only(top: 10, bottom: 10),
              alignment: Alignment.centerLeft,
              child:  new Text(
                '美食介绍:',
                style: new TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(0, 0, 255, 1),
                ),
              ),
            ),
            new Text(state.show),
            new Container(
              padding: new EdgeInsets.only(top: 10, bottom: 10),
              alignment: Alignment.centerLeft,
              child:  new Text(
                  '产品图片:',
                  style: new TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(0, 0, 255, 1),
                  ),
                  textAlign: TextAlign.left
              ),
            ),

            new Row(
              children: <Widget>[
                new Image(
                  image: AssetImage(state.protuct_img),
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),
                new Image(
                  image: AssetImage(state.protuct_img),
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                new Container(
                  padding: new EdgeInsets.only(top: 10, right: 30),
                  child: new RaisedButton(
                    child: new Text('退出'),
                    onPressed: () {
                        dispatch(GridActionCreator.backAction(state.is_collection, state.id));
                    },
                  ),
                ),
                new Container(
                  padding: new EdgeInsets.only(top: 10, left: 30),
                  child: new RaisedButton(
                    child: new Text('查看商家'),
                    onPressed: () {

                    },
                  ),
                ),
              ],
            ),
          ],
        )
    ),
  );
}