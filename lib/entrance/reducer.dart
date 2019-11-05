import 'dart:convert';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_fish_app/model.dart';

import 'action.dart';
import 'state.dart';
import '../api.dart';

Reducer<EntranceState> buildReducer() {
  return asReducer(
    <Object, Reducer<EntranceState>>{
      EntranceAction.action: _onAction,
      EntranceAction.loadData: _onLoadData, //接收loadData Action
      EntranceAction.onEditAction: _editAction,
      EntranceAction.onGetMoreData: _onGetMoreData,
    },
  );
}

EntranceState _onAction(EntranceState state, Action action) {
  final EntranceState newState = state.clone();
  return newState;
}

//初始化数据
EntranceState _onLoadData(EntranceState state, Action action) {
  final EntranceState newState = state.clone()
    ..shopList = Api().getModel();//从Api请求数据
  return newState;
}

EntranceState _editAction(EntranceState state, Action action) {
    if (action.payload != null && action.payload != []) {
       state.shopList[action.payload['id']].is_collection = action.payload['is_collection'];    //数据更新
       return state.clone()..shopList = state.shopList;                                         //重新clone一边
    }
}

EntranceState _onGetMoreData(EntranceState state, Action action) {
  List<Model> newState =  Api().getModel();
  state.shopList.addAll(newState);
  print(state.shopList.length);
  return state.clone()..shopList = state.shopList;
}

