import 'package:get/get.dart';
import 'package:task_test/dashboard/controller/dashboard_controller.dart';
import 'package:task_test/dashboard/view/dashboard_screen.dart';

class Routes {
  static const String dashboard = '/dashboard';

  static List<GetPage<dynamic>> get getPages {
    return [
      GetPage(
        name: Routes.dashboard,
        page: () => const DashboardScreen(),
        binding: BindingsBuilder.put(
          () => DashboardController(),
          // permanent: true,
        ),
        transition: Transition.cupertino,
      ),
    ];
  }
}
