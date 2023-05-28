import 'package:api_1/app/feed/model/post_model.dart';
import 'package:api_1/app/feed/service/post_service.dart';
import 'package:flutter/material.dart';

class FeedController extends ChangeNotifier {
  List<Post>? posts;
  ValueNotifier<bool> isLoaded = ValueNotifier<bool>(false);

  void fetchPosts() async {
    posts = await PostService().fetchData();
    if (posts != null) {
      isLoaded.value = true;
    }
  }
}
