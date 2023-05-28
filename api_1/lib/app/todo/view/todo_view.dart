import 'package:api_1/app/todo/controller/todo_controller.dart';
import 'package:flutter/material.dart';

class ToDoView extends StatefulWidget {
  static const routeName = 'todo';
  const ToDoView({super.key});

  @override
  State<ToDoView> createState() => _ToDoViewState();
}

class _ToDoViewState extends State<ToDoView> {
  ToDoController controller = ToDoController();

  @override
  void initState() {
    super.initState();
    controller.fetchToDos();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.isLoaded,
      builder: (context, isLoaded, child) {
        return Visibility(
          visible: isLoaded,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: ListView.builder(
            itemCount: controller.toDos?.length,
            itemBuilder: ((context, index) {
              return CheckboxListTile(
                value: controller.toDos![index].completed,
                onChanged: (newValue) {
                  setState(
                    () {
                      if (newValue != null) {
                        controller.toDos![index].completed = newValue;
                      }
                    },
                  );
                },
                title: Text(controller.toDos![index].title),
              );
            }),
          ),
        );
      },
    );
  }
}
