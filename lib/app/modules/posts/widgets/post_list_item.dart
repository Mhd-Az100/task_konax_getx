import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_konax_getx/app/models/posts_model.dart';

class PostListItem extends StatelessWidget {
  final PostsModel? post;

  const PostListItem({Key? key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        Get.toNamed('/post-details', arguments: post?.id.toString());
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Text('${post?.id}', style: textTheme.caption),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
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
