import 'package:flutter/material.dart';
import 'package:my_simple_store/presentation/pages/hisotory_sells.dart';
import 'package:my_simple_store/presentation/pages/home.dart';
import 'package:my_simple_store/presentation/pages/all_products.dart';

List<String> menuNames = ['Главная', 'Товары', 'История'];
List<Icon> menuIcons = [
  const Icon(Icons.home_outlined),
  const Icon(Icons.all_inbox_rounded),
  const Icon(Icons.history_outlined)
];
List floatListNames = ["Добавить категории", "Добавить товары"];
List floatListIcons = [Icons.playlist_add_check, Icons.add_box_outlined];
List<String> sizes = ['36, .. ,45', 'XS, .. ,6XL'];
List<String> sizeType1 = [
  'xs',
  's',
  'medium',
  'large',
  'xl',
  '2xl',
  '3xl',
  '4xl',
  '5xl',
  '6xl',
  '7xl'
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
    const HistorySellsPage(),
  ];
  return pages;
}
