import 'package:get/get.dart';
import '../controllers/dompet_detail_controller.dart';

class DompetDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DompetDetailController>(() => DompetDetailController());
  }
}
