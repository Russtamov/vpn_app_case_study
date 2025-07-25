import 'package:get/get.dart';
import '../controller/vpn_countries_selection_controller.dart';
import '../../../../core/app_export.dart';

class VpnCountriesSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VpnCountriesSelectionController());
  }
}
