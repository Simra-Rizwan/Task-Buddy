import "package:get/get.dart";

class CashEpicController extends GetxController{
  var history=<Map<String,dynamic>>[
    {
      'title':'Cash \$1',
      'date':'12/03/2025',
      'epicDollars': 4,
      'image':'assets/images/cash_image.png',
    },
    {
      'title':'Remote Car',
      'date':'12/03/2025',
      'epicDollars':4,
      'image':'assets/images/remote_car_image.png',
    },
    {
      'title':'Cash \$1',
      'date':'12/03/2025',
      'epicDollars':4,
    'image':'assets/images/cash_image.png',
    },
    {
      'title':'Remote Car',
      'date':'12/03/2025',
      'epicDollars':4,
      'image':'assets/images/remote_car_image.png'
    },
  ].obs;
}