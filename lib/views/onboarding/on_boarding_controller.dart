import 'package:aicha/models/Users.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  check() {
    var storage = GetStorage();
    storage.write("seen", 1);
  }

  saveUser(Cusers user) {
    GetStorage().write("auth", 1);
    GetStorage().write('user', {
      'name': user.userName,
      'email': user.Email,
      'gsm': user.Gsm,
      'uid': user.uid,
    });
  }

  logOut() {
    GetStorage().remove("user");
    GetStorage().remove("auth");
    Get.toNamed("/login");
  }
}
