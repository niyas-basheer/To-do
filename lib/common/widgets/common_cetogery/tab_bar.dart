import 'package:flutter/material.dart';
import 'package:to_do/utils/constants/colors.dart';
import 'package:to_do/utils/device/device_utility.dart';
import 'package:to_do/utils/helpers/helper_function.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({super.key, required this.tabs});
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Material(
      color: dark ? Tcolors.black : Tcolors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: Tcolors.primary,
        labelColor: dark ? Tcolors.white : Tcolors.primary,
        unselectedLabelColor: Tcolors.darkerGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
