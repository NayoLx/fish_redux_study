import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import '../four/page.dart';
import 'action.dart';
import 'state.dart';

Effect<threeState> buildEffect() {
  return combineEffects(<Object, Effect<threeState>>{
    Lifecycle.initState: _initState,
    threeAction.toFourPage: _toFourPage,
  });
}

void _initState(Action action, Context<threeState> ctx) {
}

void _toFourPage(Action action, Context<threeState> ctx) {
  Navigator.pushReplacement(ctx.context,
      PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) {
            return Center(
              child: Container(
                width: 350,
                height: 150,
                decoration: new BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  border: new Border.all(width: 1, color: Colors.grey),
                ),
                child: fourPage().buildPage(null),
              ),
            );
          }
      )
  );
}
