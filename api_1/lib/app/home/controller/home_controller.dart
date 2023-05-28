import 'package:flutter/material.dart';

class HomeController extends ValueNotifier<int> {
  HomeController() : super(0);
  late PageController pageController;

  void initPageController() {
    pageController = PageController(initialPage: value);
    notifyListeners();
  }

  void setCurrentPage(int pageIndex) {
    value = pageIndex;
  }
}
