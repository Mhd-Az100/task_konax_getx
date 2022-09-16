import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_konax_getx/app/models/posts_model.dart';

class PostDetails extends StatelessWidget {
  final PostsModel? post;

  const PostDetails({Key? key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        Get.toNamed('/post-details', arguments: post?.id.toString());
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.all(14),
              child: Text(post?.title ?? ''),
            ),
            isThreeLine: true,
            subtitle: Text(post?.body ?? ''),
            dense: true,
          ),
        ),
      ),
    );
  }
}
