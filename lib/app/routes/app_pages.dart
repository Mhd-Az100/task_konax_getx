import 'package:get/get.dart';

import '../modules/post_details/bindings/post_details_binding.dart';
import '../modules/post_details/views/post_details_comments_view.dart';
import '../modules/posts/bindings/posts_binding.dart';
import '../modules/posts/views/posts_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.POSTS;

  static final routes = [
    GetPage(
      name: _Paths.POSTS,
      page: () => PostsView(),
      binding: PostsBinding(),
    ),
    GetPage(
      name: _Paths.POST_DETAILS,
      page: () => PostDetailsView(),
      binding: PostDetailsBinding(),
    ),
  ];
}
