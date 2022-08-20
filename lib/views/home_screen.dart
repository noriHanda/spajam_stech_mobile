import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spajam_stech/controllers/post_list_notifier.dart';
import 'package:spajam_stech/views/components/hanabi_segment.dart';
import 'package:spajam_stech/views/input_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    Future.microtask(() => ref.read(postListProvider.notifier).loadPosts());
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final postList = ref.watch(postListProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: postList.length,
            itemBuilder: (context, index) => HanabiSegment(
              index: index,
              maxLength: postList.length,
              post: postList[index],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push<Object?>(
            context,
            MaterialPageRoute<Object?>(
              builder: (context) => InputScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
