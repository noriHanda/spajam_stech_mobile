import 'package:spajam_stech/models/post.dart';

extension CreatePost on Post {
  static Post createPost({
    String? name,
    required double time,
    required String imageUrl,
  }) {
    return Post(name: name, time: time, imageUrl: imageUrl);
  }
}
