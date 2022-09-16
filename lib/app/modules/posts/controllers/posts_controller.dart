import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_konax_getx/app/data/api/api_network.dart';
import 'package:task_konax_getx/app/models/posts_model.dart';

class PostsController extends GetxController {
  NetworkService networkService = NetworkService();
  ScrollController scrollController = ScrollController();
  RxList<PostsModel> posts = <PostsModel>[].obs;
  //

  //
  int page = 1;
  //
  bool isTheLast = false;
  //
  RxBool isLoading = false.obs;
  RxBool isLoadingposts = false.obs;
  //
  //
  Future getPosts({bool? isPaginattion}) async {
    //

    if (isPaginattion ?? false) {
      isLoadingposts(true);
    } else {
      isLoading.value = true;
    }
    //
    var response = await networkService.get(
        url: "posts?_page=$page&_limit=10", istoken: false);
    //
    isLoading.value = false;

    page++;
    final data = jsonDecode(response.body);
    if (isPaginattion ?? false) {
      isLoadingposts(false);
      (data.forEach(
        (e) => posts.value.add(PostsModel.fromJson(e)),
      ));
    } else {
      isLoading.value = false;
      (data.forEach(
        (e) => posts.value.add(PostsModel.fromJson(e)),
      ));
    }

    return;

    //

    //
  }

  //
  @override
  void onInit() async {
    await getPosts();
    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          getPosts(isPaginattion: true);
        }
      },
    );
    super.onInit();
  }
}
