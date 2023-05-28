import 'package:api_1/app/feed/view/feed_view.dart';
import 'package:api_1/app/home/controller/home_controller.dart';
import 'package:api_1/app/todo/view/toDo_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  static const routeName = '/';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.initPageController();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, currentPageIndex, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("API Study App"),
            centerTitle: true,
          ),
          body: SafeArea(
            child: PageView(
              controller: controller.pageController,
              children: const [
                FeedView(),
                ToDoView(),
              ],
              onPageChanged: (pageIndex) {
                controller.setCurrentPage(pageIndex);
              },
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentPageIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: "To-Dos",
              ),
            ],
            onTap: (pageIndex) {
              controller.pageController.animateToPage(
                pageIndex,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeIn,
              );
            },
          ),
        );
      },
    );
  }
}
