import 'package:flutter/material.dart';

import '../core/utils/custom_theme_data.dart';

class YBAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  const YBAppBar({
    Key? key,
    this.actions,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
          title,
          style: const TextStyle(
              color: YBColors.mainBackgroundColor
          )
      ),
      centerTitle: true,
      backgroundColor: YBColors.appBarBackgroundColor,
      elevation: 0.0,
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}