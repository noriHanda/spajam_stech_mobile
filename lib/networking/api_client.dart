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
}

class ApiResult {
  ApiResult.success() : exception = null;
  ApiResult.failure({required this.exception});

  final Exception? exception;
}
