import '../app_export.dart';
import 'package:get/get.dart';
import '../../features/presentation/vpn_countries_selection_screen/vpn_countries_selection_screen.dart';

import '../../features/presentation/vpn_countries_selection_screen/binding/vpn_countries_selection_binding.dart';

class AppRoutes {
  static const String vpnCountriesSelectionScreen =
      '/vpn_countries_selection_screen';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => VpnCountriesSelectionScreen(),
      bindings: [VpnCountriesSelectionBinding()],
    ),
  ];
}
