import 'package:api_1/app/todo/model/todo.dart';
import 'package:api_1/app/todo/service/todo_service.dart';
import 'package:flutter/material.dart';

class ToDoController extends ChangeNotifier {
  List<ToDo>? toDos;
  ValueNotifier<bool> isLoaded = ValueNotifier(false);
  ValueNotifier<bool> isChecked = ValueNotifier(false);

  void fetchToDos() async {
    toDos = await ToDoService().fetchData();
    if (toDos != null) {
      isLoaded.value = true;
    }
  }
}
