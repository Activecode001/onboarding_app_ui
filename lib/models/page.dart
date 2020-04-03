import 'package:flutter/material.dart';

class Page {
  String image, title, subTitle;
  List<Color> titleGradient = [];

  Page({
    @required this.image,
    @required this.title,
    @required this.subTitle,
    @required this.titleGradient,
  });
}

List<List<Color>> gradients = [
  [Color(0xffefb55f), Color(0xffffe0b2)],
  [Color(0xffbebc06), Color(0xfff2a498)],
  [Color(0xfff52981), Color(0xff15bcff)],
];

List pageList = [
  Page(
    image: 'assets/busn1.png',
    title: 'Trust',
    subTitle: 'From our existing clients',
    titleGradient: gradients[0],
  ),
  Page(
    image: 'assets/busn2.png',
    title: 'Feasibility',
    subTitle: 'Ready before starting',
    titleGradient: gradients[1],
  ),
  Page(
    image: 'assets/busn3.png',
    title: 'Support',
    subTitle: 'All the time everywhere',
    titleGradient: gradients[2],
  ),
];
