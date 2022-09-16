import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_konax_getx/app/models/posts_model.dart';

import '../controllers/posts_controller.dart';
import '../widgets/post_list_item.dart';

class PostsView extends GetView<PostsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PostsView'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () {
          FocusScope.of(context).requestFocus(FocusNode());
          controller.page = 1;
          controller.posts.value = <PostsModel>[];
          return controller.getPosts();
        },
        child: Column(
          children: [
            Obx(() => controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : controller.posts.isEmpty
                    ? const Text('is empty')
                    : Expanded(
                        child: ListView(
                          controller: controller.scrollController,
                          children: [
                            ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.posts.length,
                                itemBuilder: (context, index) => PostListItem(
                                    post: controller.posts[index])),
                            Visibility(
                              child: const Center(
                                      child: CircularProgressIndicator())
                                  .paddingAll(20),
                              visible: controller.isLoadingposts.value,
                            )
                          ],
                        ),
                      )),
          ],
        ),
      ),
    );
  }
}
