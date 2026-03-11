import 'package:get/get.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/dompet/bindings/dompet_binding.dart';
import '../modules/dompet/views/dompet_view.dart';
import '../modules/dompet/bindings/dompet_detail_binding.dart';
import '../modules/dompet/views/dompet_detail_view.dart';
import '../modules/dompet/bindings/dompet_settings_binding.dart';
import '../modules/dompet/views/dompet_settings_view.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.dompet,
      page: () => const DompetView(),
      binding: DompetBinding(),
    ),
    GetPage(
      name: Routes.dompetDetail,
      page: () => const DompetDetailView(),
      binding: DompetDetailBinding(),
    ),
    GetPage(
      name: Routes.dompetSettings,
      page: () => const DompetSettingsView(),
      binding: DompetSettingsBinding(),
    ),
  ];
}
