import 'package:get/get.dart';
import 'package:travelapp/services/storage.dart';

import '../../utils/constants.dart';

class MainStore extends GetxController {
  RxBool isFirstLaunch = false.obs;

  MainStore() {
    getIsFirstLaunch();
  }

  setIsFirstLaunch(bool value) {
    isFirstLaunch.value = value;
    saveDataLocal(IS_FIRST_LAUNCH, isFirstLaunch.value ? 'true' : 'false');
  }

  getIsFirstLaunch() {
    getDataLocal(IS_FIRST_LAUNCH).then((res) {
      print("namhe: $res --- ${res == ''}");
      res == '' ? (isFirstLaunch.value = true) : (isFirstLaunch.value = false);
    });
  }
}
