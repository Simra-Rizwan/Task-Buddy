import 'package:get/get.dart';
import '../Models/MyTasksModel.dart';


class MyTasksController extends GetxController {
  RxInt coinBalance = 400.obs;

  RxList<MyTasksModel> tasks = <MyTasksModel>[
    MyTasksModel(title: "Clean your room", time: "4:00 PM", coins: 4, imagePath: "assets/icons/task.png"),
    MyTasksModel(title: "Do home work", time: "4:00 PM", coins: 4, imagePath: "assets/icons/books.png", isCompleted: true),
    MyTasksModel(title: "Clean your room", time: "4:00 PM", coins: 4, imagePath: "assets/icons/task.png"),
    MyTasksModel(title: "Clean your room", time: "4:00 PM", coins: 4, imagePath: "assets/icons/task.png"),
    MyTasksModel(title: "Clean your room", time: "4:00 PM", coins: 4, imagePath: "assets/icons/task.png"),
    MyTasksModel(title: "Clean your room", time: "4:00 PM", coins: 4, imagePath: "assets/icons/task.png"),
    MyTasksModel(title: "Clean your room", time: "4:00 PM", coins: 4, imagePath: "assets/icons/task.png"),
    MyTasksModel(title: "Clean your room", time: "4:00 PM", coins: 4, imagePath: "assets/icons/task.png"),
    MyTasksModel(title: "Clean your room", time: "4:00 PM", coins: 4, imagePath: "assets/icons/task.png"),
    MyTasksModel(title: "Clean your room", time: "4:00 PM", coins: 4, imagePath: "assets/icons/task.png")
  ].obs;

  void toggleTaskCompletion(int index) {
    tasks[index].isCompleted = !tasks[index].isCompleted;
    tasks.refresh();
  }
}
