import 'package:get/get.dart';

class HomeStore extends GetxController {
  RxString selectDate = ''.obs;
  RxInt countGuest = 1.obs;
  RxInt countRoom = 1.obs;

  HomeStore() {}

  setDate(String string) {
    selectDate.value = string;
    update();
  }

  setGuest(int value) {
    countGuest.value = value;
    update();
  }

  setRoom(int value) {
    countRoom.value = value;
    update();
  }
}
