import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habit_hooked/screen/habit_module/home_screen/home_screen.dart';

import 'config/routes/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: .9,
          viewInsets: MediaQuery.of(context).viewInsets,
        ),
        child: GetMaterialApp(
          initialRoute:
         Routes.homeScreen,
          getPages: Routes.pages,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

