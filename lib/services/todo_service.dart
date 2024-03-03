import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tut_prov_app/model/todo.dart';

class TodoService {
  Future<List<Todo>> getAll() async {
    const url = 'https://jsonplaceholder.typicode.com/todos';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final todos = json.map((e) {
        return Todo(
            userID: e['userId'],
            title: e['title'],
            completed: e['completed'],
            id: e['id']);
      }).toList();
      return todos;
    }
    return [];
    //throw "Something went wrong";
  }
}
