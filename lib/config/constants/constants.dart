import 'package:flutter/material.dart';
import 'package:my_simple_store/presentation/pages/hisotory_sells.dart';
import 'package:my_simple_store/presentation/pages/home.dart';
import 'package:my_simple_store/presentation/pages/sell_goods.dart';
import 'package:my_simple_store/presentation/pages/all_products.dart';

List<String> menuNames = ['Главная', 'Продажа', 'Товары', 'История'];
List<Icon> menuIcons = [
  const Icon(Icons.home_outlined),
  const Icon(Icons.sell_outlined),
  const Icon(Icons.all_inbox_rounded),
  const Icon(Icons.history_outlined)
];
List floatListNames = ["Добавить категории", "Добавить товары"];
List floatListIcons = [Icons.playlist_add_check, Icons.add_box_outlined];

getPages() {
  final List<Widget> pages = [
    const HomePage(),
    const SellGoodsPage(),
    const AllProductsPage(),
    const HistorySellsPage(),
  ];
  return pages;
}
