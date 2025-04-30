import 'package:get/get.dart';
import '../Models/RewardItemModel.dart';

class RewardStoreController extends GetxController {
  var rewards = <RewardItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadRewards();
  }

  void loadRewards() {
    rewards.value = [
      RewardItemModel(name: 'Remote car', price: 40, earned: 30, image: 'assets/images/remote_car.png'),
      RewardItemModel(name: 'Robot', price: 40, earned: 40, image: 'assets/images/robot.png'),
      RewardItemModel(name: 'Helicopter', price: 40, earned: 40, image: 'assets/images/helicopter.png'),
      RewardItemModel(name: 'Kite', price: 40, earned: 30, image: 'assets/images/kite.png'),
      RewardItemModel(name: 'Horse', price: 40, earned: 30, image: 'assets/images/horse.png'),
      RewardItemModel(name: 'Helicopter', price: 40, earned: 30, image: 'assets/images/helicopter.png'),
      RewardItemModel(name: 'Robot', price: 40, earned: 40, image: 'assets/images/robot.png'),
      RewardItemModel(name: 'Remote car', price: 40, earned: 30, image: 'assets/images/remote_car.png'),
      RewardItemModel(name: 'Horse', price: 40, earned: 30, image: 'assets/images/horse.png'),
      RewardItemModel(name: 'Horse', price: 40, earned: 30, image: 'assets/images/horse.png'),
      RewardItemModel(name: 'Kite', price: 40, earned: 30, image: 'assets/images/kite.png'),
      RewardItemModel(name: 'Helicopter', price: 40, earned: 30, image: 'assets/images/helicopter.png'),
    ];
  }
}
