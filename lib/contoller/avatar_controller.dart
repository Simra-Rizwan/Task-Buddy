import "package:get/get.dart";

class AvatarController extends GetxController{
  //default index set as 0

  var selectedAvatarIndex= 0.obs;

  void selectAvatar(int index){
     selectedAvatarIndex.value= index;
  }
}