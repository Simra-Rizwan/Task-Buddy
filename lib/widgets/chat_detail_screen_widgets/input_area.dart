import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class InputArea extends StatelessWidget {
  const InputArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: AppColors.secondary,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Transform.rotate(
              angle: 0.5, // Tilt right
              child: Icon(Icons.attach_file, color: AppColors.orange),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Type a Message",
                  hintStyle: TextStyle(
                    color: AppColors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Baloo2",
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              height: 24,
              width: 1,
              color: Colors.grey.shade300,
              margin: const EdgeInsets.symmetric(horizontal: 8),
            ),
            Transform.rotate(
              angle: -0.5, // Tilt left
              child: Icon(Icons.send, color: AppColors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
