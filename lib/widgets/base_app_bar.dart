import 'package:flutter/material.dart';
import 'package:shop_schedule/constants/app_constants.dart';

import 'base_text.dart';

class BaseAppBar extends StatelessWidget {
  final String titleText;
  final Color titleColor;
  final VoidCallback? onPress;
  final VoidCallback? onPressBack;
  final VoidCallback? onPressAdd;
  final bool isBack;
  final String actionText;

  const BaseAppBar(
      {super.key,
      this.titleText = "",
      this.titleColor = AppConstant.textColor,
      this.onPress,
      this.onPressBack,
      this.onPressAdd,
      this.isBack = true,
      this.actionText = ""});

  List<Widget> endAction() {
    if (actionText != "") {
      return [
        IconButton(
          icon: BaseText(
            text: actionText,
            color: AppConstant.redColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          onPressed: onPress,
        )
      ];
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 3,
          offset: const Offset(0, 3),
        )
      ]),
      child: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 5.0,
        centerTitle: true,
        title: BaseText(
          text: titleText,
          color: titleColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        leading: isBack
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios,
                    color: AppConstant.textColor),
                onPressed: onPressBack ??
                    () {
                      Navigator.pop(context);
                    })
            : null,
        actions: (actionText != "") ? endAction() : null,
      ),
    );
  }
}
