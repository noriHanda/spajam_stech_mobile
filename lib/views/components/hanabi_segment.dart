import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spajam_stech/gen/assets.gen.dart';
import 'package:spajam_stech/models/post.dart';

class HanabiSegment extends StatelessWidget {
  const HanabiSegment({
    required this.index,
    super.key,
    required this.maxLength,
    required this.post,
  });
  final int index;
  final int maxLength;
  final Post post;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            child: Image.asset(
              index == 0
                  ? Assets.hanabi.senkouHanabiHandle.path
                  : index == maxLength - 1
                      ? Assets.hanabi.senkouHanabiHeader.path
                      : Assets.hanabi.senkouHanabiBody.path,
              height: 50,
              fit: BoxFit.fill,
            ),
          ),
          CachedNetworkImage(
            imageUrl: post.imageUrl!,
          ),
        ],
      ),
    );
  }
}
