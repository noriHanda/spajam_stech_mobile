import 'package:flutter_test/flutter_test.dart';
import 'package:spajam_stech/networking/api_client.dart';
import 'package:spajam_stech/networking/app_dio.dart';

void main() {
  test('api client ...', () async {
    final dio = AppDio.getInstance();
    final api = ApiClient(client: dio);
    final posts = await api.getPosts();
    expect(posts.length, greaterThan(0));
  });
}
