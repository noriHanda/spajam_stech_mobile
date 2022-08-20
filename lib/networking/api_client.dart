
import 'package:dio/dio.dart';
import 'package:spajam_stech/models/post.dart';

class ApiClient {
  ApiClient({required this.client});

  final Dio client;

  Future<ApiResult> createPost(Post post) async {
    final postJson = post.toJson();
    try {
      await client.post<Map<String, dynamic>>('/posts', data: postJson);
      return ApiResult.success();
    } on FormatException catch (fe) {
      return ApiResult.failure(exception: fe);
    } on Exception catch (e) {
      return ApiResult.failure(exception: e);
    }
  }

  Future<List<Post>> getPosts() async {
    final response = await client.get<List<dynamic>>('/posts');
    final resultList = <Post>[];
    if (response.data == null) {
      return resultList;
    }
    final jsonList = response.data!;
    for (final json in jsonList) {
      final post = Post.fromJson(json as Map<String, dynamic>);
      resultList.add(post);
    }
    // for (final json in jsonList) {
    //   final Map<String,dynamic> decoded = jsonDecode(json.toString());
    //   final post = Post.fromJson(decoded);
    //   resultList.add(post);
    // }
    return resultList;
  }
}

class ApiResult {
  ApiResult.success() : exception = null;
  ApiResult.failure({required this.exception});

  final Exception? exception;
}
