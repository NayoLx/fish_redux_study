import 'package:fish_redux/fish_redux.dart';
import 'component/component.dart';

import 'action.dart';
import 'state.dart';

Future loadData(Context<SecondState> ctx) async {
  final List<SecondPageState> initList = [
    SecondPageState()
      ..id = 0
      ..title = '牛油果'
      ..price = 45
      ..img = 'images/timg.jpg'
      ..peisong = '100'
      ..protuct_img = 'images/timg.jpg'
      ..show = '精选日本仙台和牛，烧制三分熟切片，淋秘制酱汁，配以新泻县鱼诏产越光米，鲜香嫩滑回味留甘，限量供应'
      ..is_collection = false,
    SecondPageState()
      ..id = 1
      ..title = '百香果'
      ..price = 10
      ..img = 'images/timg2.jpg'
      ..peisong = '100'
      ..protuct_img = 'images/timg2.jpg'
      ..show = '精选日本仙台和牛，烧制三分熟切片，淋秘制酱汁，配以新泻县鱼诏产越光米，鲜香嫩滑回味留甘，限量供应'
      ..is_collection = false,
    SecondPageState()
      ..id = 2
      ..title = '花生'
      ..price = 100
      ..img = 'images/timg3.jpg'
      ..peisong = '100'
      ..protuct_img = 'images/timg3.jpg'
      ..show = '精选日本仙台和牛，烧制三分熟切片，淋秘制酱汁，配以新泻县鱼诏产越光米，鲜香嫩滑回味留甘，限量供应'
      ..is_collection = false,
    SecondPageState()
      ..id = 3
      ..title = '牛油果'
      ..price = 50
      ..img = 'images/timg.jpg'
      ..peisong = '100'
      ..protuct_img = 'images/timg.jpg'
      ..show = '精选日本仙台和牛，烧制三分熟切片，淋秘制酱汁，配以新泻县鱼诏产越光米，鲜香嫩滑回味留甘，限量供应'
      ..is_collection = false,
    SecondPageState()
      ..id = 4
      ..title = '牛油果'
      ..price = 411
      ..img = 'images/timg2.jpg'
      ..peisong = '100'
      ..protuct_img = 'images/timg2.jpg'
      ..show = '精选日本仙台和牛，烧制三分熟切片，淋秘制酱汁，配以新泻县鱼诏产越光米，鲜香嫩滑回味留甘，限量供应'
      ..is_collection = true,
    SecondPageState()
      ..id = 5
      ..title = '牛油果'
      ..price = 600
      ..img = 'images/timg.jpg'
      ..peisong = '100'
      ..protuct_img = 'images/timg.jpg'
      ..show = '精选日本仙台和牛，烧制三分熟切片，淋秘制酱汁，配以新泻县鱼诏产越光米，鲜香嫩滑回味留甘，限量供应'
      ..is_collection = false,
  ];

  ctx.dispatch(SecondActionCreator.initInitList(initList));
}
