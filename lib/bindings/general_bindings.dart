import 'package:get/get.dart';
import 'package:siaj_ecommerce/data/services/network_manager/network_manager.dart';

class GeneralBindings extends Bindings {
  
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }

}