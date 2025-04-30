import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final IconData? icon; //
  final String? imagePath;
  final String title;
  final VoidCallback onTap;
  final Color? textColor;
  final Color? iconColor;

  const DrawerItem({
    super.key,
    required this.icon,
    this.imagePath,
    required this.title,
    required this.onTap,
    this.textColor = Colors.black,
    this.iconColor = Colors.black54,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
    //  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      leading:  imagePath != null // ✋ NEW LOGIC
          ? Image.asset(
        imagePath!,
        width: 20,
        height: 20,
        fit: BoxFit.contain,
      )
          : Icon(
        icon,
        color: iconColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          color: textColor,
        ),
      ),
      onTap: onTap,

    );
  }
}