import 'dart:math';

import 'package:flutter/material.dart';
import 'package:instaclone/widgets/post.dart';
import 'package:english_words/english_words.dart';

import '../model/post_details.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final List<PostDetail> _saved = <PostDetail>[];

  static const String _longCaption =
      "Long caption goes here. #Lorem #ipsum dolor sit amet, consectetur "
      "adipiscing elit. Integer rutrum justo eget porttitor eleifend. Duis ac "
      "diam vitae odio facilisis feugiat et quis odio. Aenean vitae justo "
      "accumsan nisi pharetra scelerisque. Donec orci diam, vestibulum vitae "
      "elementum at, ullamcorper in tortor. Ut fermentum blandit commodo.";

  void callback(PostDetail postDetail) {
    if (_saved.contains(postDetail)) {
      _saved.remove(postDetail);
    } else {
      _saved.add(postDetail);
    }

    print('SAVED POSTS imageurls:\n');
    _saved.forEach((element) {
      print(element.imageUrl);
    });
  }

  List<PostDetail> generatePostDetails(int count) {
    List<PostDetail> list = <PostDetail>[];
    for (int i = 0; i < count; i++) {
      WordPair pair = generateWordPairs().take(1).first;
      PostDetail pd = PostDetail(
        Random().nextInt(1000) + 1,
        generateWordPairs().take(1).first.asSnakeCase,
        'https://picsum.photos/id/' +
            Random().nextInt(500 - 1).toString() +
            '/500/',
        _longCaption,
        '${pair.first.replaceRange(0, 1, pair.first.substring(0, 1).toUpperCase())}'
            ' ${pair.second.replaceRange(0, 1, pair.second.substring(0, 1).toUpperCase())}',
        DateTime.now(),
        false,
        false,
      );
      list.add(pd);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    List<PostDetail> postList = <PostDetail>[];

    return Container(
      padding: EdgeInsets.zero,
      child: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            // pull new uploads
          });
        },
        child: ListView.builder(
          itemBuilder: (context, index) {
            if (index >= postList.length) {
              // generate 5 posts
              postList.addAll(generatePostDetails(5));
            }

            return Post(
              postDetail: postList[index],
              callback: callback,
            );
          },
        ),
      ),
    );
  }
}