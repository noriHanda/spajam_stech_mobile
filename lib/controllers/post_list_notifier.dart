import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spajam_stech/models/post.dart';
import 'package:spajam_stech/networking/api_client.dart';
import 'package:spajam_stech/networking/app_dio.dart';

class PostListNotifier extends StateNotifier<List<Post>> {
  PostListNotifier(this.ref) : super([]);
  Ref ref;
  Future<void> loadPosts() async {
    final dio = ref.read(dioProvider);
    final apiClient = ApiClient(client: dio);
    state = await apiClient.getPosts();
  }

  String calculateSum() {
    // ignore: omit_local_variable_types
    double sum = 0;
    for (final post in state) {
      sum += post.time!;
    }
    return sum.toStringAsFixed(3);
  }
}

final postListProvider =
    StateNotifierProvider<PostListNotifier, List<Post>>((ref) {
  return PostListNotifier(ref);
});
