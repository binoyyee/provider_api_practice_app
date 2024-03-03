import 'package:flutter/material.dart';
import 'package:tut_prov_app/services/todo_service.dart';

import '../model/todo.dart';

class TodoProvider extends ChangeNotifier {
  final _service = TodoService();
  bool isLoading = false;
  List<Todo> _todos = []; //can be seen and modified in this class only
  List<Todo> get todos =>
      _todos; //to make it available outside of this class using getter method

  Future<void> getAllTodos() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getAll();
    _todos = response;
    isLoading = false;
    notifyListeners();
  }
}
