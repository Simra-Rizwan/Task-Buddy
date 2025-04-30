class MyTasksModel {
  final String title;
  final String time;
  final int coins;

  final String imagePath;
  bool isCompleted;

  MyTasksModel({
    required this.title,
    required this.time,
    required this.coins,
    required this.imagePath,
    this.isCompleted = false,
  });
}
