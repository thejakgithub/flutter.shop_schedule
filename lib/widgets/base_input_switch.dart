import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:shop_schedule/constants/app_constants.dart';
import 'package:shop_schedule/widgets/base_text.dart';

// ignore: must_be_immutable
class BaseInputSwitch extends StatefulWidget {
  BaseInputSwitch({
    super.key,
    required this.title,
    required this.isCheck,
    required this.onCheck,
    this.color = AppConstant.greenColor,
  });

  final String title;
  bool isCheck;
  Color color;
  Function(bool) onCheck;

  @override
  State<BaseInputSwitch> createState() => _BaseInputSwitchState();
}

class _BaseInputSwitchState extends State<BaseInputSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BaseText(
          text: widget.title,
          color: AppConstant.textColor,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        FlutterSwitch(
          width: 60,
          height: 30,
          showOnOff: true,
          activeText: "ON",
          inactiveText: "OFF",
          valueFontSize: 10,
          activeTextFontWeight: FontWeight.w500,
          inactiveTextFontWeight: FontWeight.w500,
          activeTextColor: widget.color,
          inactiveTextColor: const Color(0xffA5AABE),
          activeColor: Colors.white,
          inactiveColor: Colors.white,
          activeSwitchBorder: Border.all(
            color: widget.color,
            width: 3.0,
          ),
          inactiveSwitchBorder: Border.all(
            color: const Color(0xffA5AABE),
            width: 3.0,
          ),
          activeToggleColor: widget.color,
          inactiveToggleColor: const Color(0xffA5AABE),
          value: widget.isCheck,
          onToggle: widget.onCheck,
        )
      ],
    );
  }
}
