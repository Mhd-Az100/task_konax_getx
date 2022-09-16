import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primaryColor: Colors.black,
        textTheme: const TextTheme(
            button: TextStyle(
          fontSize: 15,
        )),
      ),
    ),
  );
}
