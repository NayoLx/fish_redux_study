import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import '../second/page.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(EntranceState state, Dispatch dispatch, ViewService viewService) {
  return  DefaultTabController(
    length: 4,
    child: Scaffold(
      appBar: AppBar(
        title: TabBar(
          tabs: [
            Tab(text: '美食1'),
            Tab(text: '美食2'),
            Tab(text: '美食3'),
            Tab(text: '美食4'),
          ],
        ),
      ),
      body: TabBarView(
        children: [
           new GestureDetector (
             child: RefreshIndicator(
                 child: new ListView.builder(
                   controller: state.controller,
                   itemCount: state.shopList?.length,
                   padding: const EdgeInsets.all(16.0),
                   itemBuilder: (context, i) {
                     return new Column(
                         children: <Widget>[
                           new Row(
                               children: <Widget>[
                                 new Container(
                                   child: new Image(
                                     image: AssetImage('${state.shopList[i]?.img}'),
                                     width: 150,
                                     height: 150,
                                     fit: BoxFit.cover,
                                   ),
                                   width: 150,
                                   height: 150,
                                   padding: new EdgeInsets.only(top: 10, bottom: 10),
                                   margin: new EdgeInsets.only(right: 10, left: 10),
                                 ),
                                 new Column(
                                     children: <Widget>[
                                       new Row(
                                         children: <Widget>[
                                           new Container(
                                             padding: new EdgeInsets.only(right: 10),
                                             child: new Text(
                                               '${state.shopList[i]?.title}',
                                               style: new TextStyle(
                                                   fontSize: 18
                                               ),
                                             ),
                                           ),
                                           new GestureDetector(
                                             onTap: () {
                                               dispatch(EntranceActionCreator.showToast(i, state.shopList[i]?.price));
                                             },
                                             child: new Text('￥${state.shopList[i]?.price}'),
                                           )
                                         ],
                                       ),
                                       new Row(
                                         children: <Widget>[
                                           new Container(
                                             padding: new EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
                                             child:  new Text('当日午餐',
                                               style: new TextStyle(
                                                   color: Color.fromARGB(100, 0, 0, 128)
                                               ),
                                             ),
                                           ),
                                           new Container(
                                             padding: new EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
                                             child: new Text('当日晚餐',
                                                 style: new TextStyle(
                                                     color: Color.fromRGBO(96, 96, 96, 0.5)
                                                 )
                                             ),
                                           ),
                                           new Container(
                                             padding: new EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
                                             child: new Text('当日夜宵',
                                                 style: new TextStyle(
                                                     color: Color.fromRGBO(96, 96, 96, 0.5)
                                                 )
                                             ),
                                           ),
                                         ],
                                       ),
                                       new Container(
                                         padding: new EdgeInsets.only(bottom: 10),
                                         child: new GestureDetector(
                                           child: new Text('${state.shopList[i]?.is_collection}' == 'true' ? '已收藏' : '收藏'),
                                           onTap: () {
                                             dispatch(EntranceActionCreator.onOpenGrid(state.shopList[i]));
                                           },
                                         ),
                                       ),
                                       new Row(
                                         children: <Widget>[
                                           new Container(
                                             padding: new EdgeInsets.only(right: 20),
                                             child: new Text('用礼金兑换', style: new TextStyle(color: Colors.redAccent),),
                                           ),
                                           new Container(
                                             child: new Text('送给TA', style: new TextStyle(color: Colors.white),),
                                             alignment: Alignment(0, 0),
                                             color: Colors.pink,
                                             width: 50,
                                             height: 25,
                                           ),
                                         ],
                                       ),
                                     ]
                                 )
                               ]
                           )
                         ]
                     );
                   },
                 ),
                 onRefresh:() async{
                   await dispatch(EntranceActionCreator.onRefreshUp());
                 },
             ),
          ),
          new GestureDetector(
            onTap: () {
              dispatch(EntranceActionCreator.toSecondPage());
            },
            child: Icon(Icons.insert_drive_file),
          ),
          new GestureDetector(
            child: Icon(Icons.calendar_view_day),
          ),
          Icon(Icons.directions_bike),
        ],
      ),
    ),
  );
}



