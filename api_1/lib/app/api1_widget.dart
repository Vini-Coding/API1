import 'package:api_1/app/feed/view/feed_view.dart';
import 'package:api_1/app/home/view/home_view.dart';
import 'package:api_1/app/todo/view/todo_view.dart';
import 'package:flutter/material.dart';

class Api1Widget extends StatelessWidget {
  const Api1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute: HomeView.routeName,
      routes: {
        HomeView.routeName: (context) => const HomeView(),
        FeedView.routeName: (context) => const FeedView(),
        ToDoView.routeName: (context) => const ToDoView(),
      },
    );
  }
}
