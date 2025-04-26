import 'package:get/get.dart';

class AchievementController extends GetxController {
  var currentBadges =
      [
        {'title': 'Homework hero', 'image': 'assets/images/homework_hero.png'},
        {
          'title': 'Cleaning champ',
          'image': 'assets/images/cleaning_champ.png',
        },
        {'title': 'Puzzle master', 'image': 'assets/images/puzzle_master.png'},
        {'title': 'Homework hero', 'image': 'assets/images/homework_hero.png'},
        {
          'title': 'Cleaning champ',
          'image': 'assets/images/cleaning_champ.png',
        },
        {'title': 'Puzzle master', 'image': 'assets/images/puzzle_master.png'},
      ].obs;

  var lockedBadges = [
    {
      'badgeImage': 'assets/images/homework_hero.png',
      'lockImage': 'assets/images/locked_image.png',
    },
    {
      'badgeImage': 'assets/images/homework_hero.png',
      'lockImage': 'assets/images/locked_image.png',
    },
    {
      'badgeImage': 'assets/images/homework_hero.png',
      'lockImage': 'assets/images/locked_image.png',
    },
    {
      'badgeImage': 'assets/images/homework_hero.png',
      'lockImage': 'assets/images/locked_image.png',
    },
    {
      'badgeImage': 'assets/images/homework_hero.png',
      'lockImage': 'assets/images/locked_image.png',
    },
    {
      'badgeImage': 'assets/images/homework_hero.png',
      'lockImage': 'assets/images/locked_image.png',
    },
  ].obs;
}
