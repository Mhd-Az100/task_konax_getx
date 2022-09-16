import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_konax_getx/app/data/api/api_network.dart';
import 'package:task_konax_getx/app/models/comments_model.dart';
import 'package:task_konax_getx/app/models/posts_model.dart';

class PostDetailsController extends GetxController {
  NetworkService networkService = NetworkService();
  ScrollController scrollController = ScrollController();
  RxList<CommentsModel> comments = <CommentsModel>[].obs;
  Rx<PostsModel> details = PostsModel().obs;
  //
  String? id;
  //
  int page = 1;
  //
  bool isTheLast = false;
  //
  RxBool isLoading = false.obs;
  RxBool isLoadingdetails = false.obs;
  RxBool isLoadingposts = false.obs;
  //
  //
  Future getComments({bool? isPaginattion}) async {
    //

    if (isPaginattion ?? false) {
      isLoadingposts(true);
    } else {
      isLoading.value = true;
    }
    //
    var response = await networkService.get(
        url: "posts/$id/comments?_page=$page&_limit=3", istoken: false);
    //
    isLoading.value = false;

    page++;
    final data = jsonDecode(response.body);
    if (isPaginattion ?? false) {
      isLoadingposts(false);
      (data.forEach(
        (e) => comments.value.add(CommentsModel.fromJson(e)),
      ));
    } else {
      (data.forEach(
        (e) => comments.value.add(CommentsModel.fromJson(e)),
      ));
    }
    isLoading.value = false;

    return;

    //

    //
  }

  Future getDetails() async {
    //

    isLoadingdetails.value = true;

    //
    var response = await networkService.get(url: "posts/$id", istoken: false);
    //

    final data = jsonDecode(response.body);
    details.value = PostsModel.fromJson(data);
    isLoadingdetails.value = false;

    return;

    //

    //
  }

  //
  @override
  void onInit() async {
    String idd = Get.arguments;
    id = idd;
    await getDetails();
    await getComments();
    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          getComments(isPaginattion: true);
        }
      },
    );
    super.onInit();
  }
}
