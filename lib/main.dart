import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_test/dashboard/controller/dashboard_controller.dart';
import 'package:task_test/page_routes/routes.dart';
import 'package:task_test/services/rest_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  registerController();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.white,
    // systemNavigationBarColor: Colors.white,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_, child) {
        return GetMaterialApp(
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child!,
            );
          },
          title: "Task",
          debugShowCheckedModeBanner: kDebugMode,
          initialRoute: Routes.dashboard,
          getPages: Routes.getPages,
        );
      },
    );
  }
}

void registerController() {
  Get.put(RestServices());
  Get.lazyPut(() => DashboardController(), fenix: true);
}
