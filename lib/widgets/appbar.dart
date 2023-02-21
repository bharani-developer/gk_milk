import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gk_milk/widgets/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:gk_milk/main.dart';
import 'package:gk_milk/utils/colors.dart' as c;

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.tittle});
  final String tittle;

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
          color: appStore.isDarkModeOn ? white : c.textColorPrimary),
      backgroundColor:
          appStore.isDarkModeOn ? c.textColorPrimary : Colors.transparent,
      title: Text(tittle, style: boldTextStyle(size: 18)),
      actions: <Widget>[
        cartIcon(context, 3),
      ], //<Widget
      centerTitle: true,
      // automaticallyImplyLeading: false,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }
}
