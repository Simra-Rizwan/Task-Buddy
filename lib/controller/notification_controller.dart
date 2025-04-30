import 'package:get/get.dart';
import '../Models/ NotificationModel.dart';


class NotificationController extends GetxController {
  RxList<NotificationModel> notifications = <NotificationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadNotifications();
  }

  void loadNotifications() {
    notifications.value = List.generate(
      8,
          (index) => NotificationModel(
        message: "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris",
        timeAgo: "5 min ago",
      ),
    );
  }
}
