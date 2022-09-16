import 'package:flutter/material.dart';
import 'package:task_konax_getx/app/models/comments_model.dart';

class CommentsCard extends StatelessWidget {
  final CommentsModel? comments;

  const CommentsCard({Key? key, this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              color: Colors.grey[100],
              child: ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(comments?.name ?? ''),
                ),
                isThreeLine: true,
                subtitle: Text(comments?.email ?? ''),
                dense: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(comments?.body ?? ''),
            )
          ],
        ),
      ),
    );
  }
}
