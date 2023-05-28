import 'package:api_1/app/feed/model/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PostService {
  Future<List<Post>?> fetchData() async {
    var client = http.Client();

    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    Response response = await client.get(url);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return postFromJson(jsonData);
    } else {
      return null;
    }
  }
}
