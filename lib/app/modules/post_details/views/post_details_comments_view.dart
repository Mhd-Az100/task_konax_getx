import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_konax_getx/app/models/comments_model.dart';
import 'package:task_konax_getx/app/modules/post_details/widgets/commenst_item.dart';
import 'package:task_konax_getx/app/modules/post_details/widgets/post_details.dart';

import '../controllers/post_details_controller.dart';

class PostDetailsView extends GetView<PostDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments on Post ${controller.id}'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () {
          FocusScope.of(context).requestFocus(FocusNode());
          controller.page = 1;
          controller.comments.value = <CommentsModel>[];
          return controller.getComments();
        },
        child: Column(
          children: [
            Obx(() => controller.isLoadingdetails.value
                ? const Center(child: CircularProgressIndicator())
                : PostDetails(post: controller.details.value)),
            const SizedBox(height: 20),
            Obx(() => controller.isLoading.value && controller.comments.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView(
                      controller: controller.scrollController,
                      children: [
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.comments.length,
                            itemBuilder: (context, index) => CommentsCard(
                                comments: controller.comments[index])),
                        Visibility(
                          child:
                              const Center(child: CircularProgressIndicator())
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
