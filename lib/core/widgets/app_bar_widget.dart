import 'package:flutter/material.dart';

class SharedAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const SharedAppBarWidget({required this.title, this.actionIcon, super.key});

  final String title;
  final IconData? actionIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [Icon(actionIcon)],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
