import 'package:api_1/app/todo/model/todo.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ToDoService {
  Future<List<ToDo>?> fetchData() async {
    var client = http.Client();

    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/todos");
    Response response = await client.get(url);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return toDoFromJson(jsonData);
    } else {
      return null;
    }
  }
}
