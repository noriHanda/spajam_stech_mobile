import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';
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
      height: 140,
      child: Row(
        children: [
          Padding(
            padding: index == 0
                ? const EdgeInsets.only(left: 74)
                : index == maxLength - 1
                    ? const EdgeInsets.only(left: 16, right: 17)
                    : const EdgeInsets.only(left: 82, right: 77),
            child: SimpleShadow(
              offset: const Offset(30, 30),
              child: Image.asset(
                index == 0
                    ? Assets.hanabi.senkouHanabiHandle.path
                    : index == maxLength - 1
                        ? Assets.hanabi.senkouHanabiHeader.path
                        : Assets.hanabi.senkouHanabiBody.path,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: post.imageUrl!,
                  height: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Text(
                      post.name == '' ? '名無し花火さん' : post.name!,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                          ),
                    ),
                    Text(
                      '  ${post.time.toString()}秒',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
