import 'package:flutter/material.dart';
import 'package:shop_schedule/constants/app_constants.dart';

class BaseCheckbox extends StatelessWidget {
  const BaseCheckbox({
    super.key,
    this.label = "",
    this.padding = const EdgeInsets.all(0),
    this.value = false,
    this.isCircle = false,
    this.scale = 1.2,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w500,
    this.fontColor = AppConstant.textColor,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool? value;
  final ValueChanged<bool> onChanged;
  final bool isCircle;
  final double scale;
  final double fontSize;
  final FontWeight fontWeight;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
            width: 20,
            child: Transform.scale(
              scale: scale,
              child: Checkbox(
                shape: isCircle
                    ? const CircleBorder()
                    : const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0))),
                side: const BorderSide(color: AppConstant.disableColor),
                activeColor: AppConstant.redColor,
                value: value,
                onChanged: (bool? newValue) {
                  onChanged(newValue!);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              label,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: fontColor,
                fontFamily: 'notosansthai',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
