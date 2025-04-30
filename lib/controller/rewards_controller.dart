import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RewardsController extends GetxController {
  final rewards = [
    {'name': 'Remote Car', 'image': 'assets/images/remote_car.png'},
    {'name': 'Robot', 'image': 'assets/images/robot.png'},
    {'name': 'Helicopter', 'image': 'assets/images/helicopter.png'},
  ].obs;
}