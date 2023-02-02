import 'package:flutter/material.dart';
import 'package:my_simple_store/presentation/pages/basket.dart';
import 'package:my_simple_store/presentation/pages/hisotory_sells.dart';
import 'package:my_simple_store/presentation/pages/home.dart';
import 'package:my_simple_store/presentation/pages/all_products.dart';

List<String> menuNames = ['Главная', 'Товары', 'Корзина', 'История'];
List<Icon> menuIcons = [
  const Icon(Icons.home_outlined),
  const Icon(Icons.all_inbox_rounded),
  const Icon(Icons.shopping_bag_outlined),
  const Icon(Icons.history_outlined)
];
List floatListNames = ["Добавить категории", "Добавить товары"];
List floatListIcons = [Icons.playlist_add_check, Icons.add_box_outlined];
List<String> sizes = ['36, .. ,45', 'XS, .. ,7XL'];
List<String> sizeType1 = [
  'XS',
  'S',
  'M',
  'L',
  'XL',
  '2XL',
  '3XL',
  '4XL',
  '5XL',
  '6XL',
  '7XL'
];
List<String> sizeType2 = [
  '35',
  '36',
  '37',
  '38',
  '39',
  '40',
  '41',
  '42',
  '43',
  '44',
  '45',
];

getPages() {
  final List<Widget> pages = [
    const HomePage(),
    const AllProductsPage(),
    const BasketPage(),
    const HistorySellsPage(),
  ];
  return pages;
}
