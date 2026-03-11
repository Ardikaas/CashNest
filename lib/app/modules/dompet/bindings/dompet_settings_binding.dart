import 'package:get/get.dart';
import '../controllers/dompet_settings_controller.dart';

class DompetSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DompetSettingsController>(() => DompetSettingsController());
  }
}
