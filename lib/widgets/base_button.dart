import 'package:flutter/material.dart';
import 'package:shop_schedule/constants/app_constants.dart';

class BaseButton extends StatelessWidget {
  final String buttonText;
  final GestureTapCallback? onPressed;
  final EdgeInsets? margin;
  final Color? buttonColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final Color textColor;
  final Color? buttonBorderColor;
  final double borderRadius;
  final Widget? icon;

  const BaseButton({
    this.icon,
    this.buttonBorderColor,
    this.width,
    this.height,
    required this.buttonText,
    this.borderRadius = 10,
    this.buttonColor = AppConstant.redColor,
    this.margin,
    this.fontSize = 18,
    this.textColor = Colors.white,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle baseButtonStyle = TextButton.styleFrom(
      foregroundColor: AppConstant.redColor,
      backgroundColor: onPressed == null
          ? AppConstant.disableColor
          : buttonColor ?? AppConstant.redColor,
      minimumSize:
          Size(width ?? MediaQuery.of(context).size.width, height ?? 50),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );

    final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.white,
      elevation: 10,
      minimumSize:
          Size(width ?? MediaQuery.of(context).size.width, height ?? 50),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      side: BorderSide(
        width: 1,
        color: buttonBorderColor ?? AppConstant.redColor,
      ),
    );

    return Padding(
      padding: margin == null ? const EdgeInsets.all(0) : margin!,
      child: TextButton(
        onPressed: onPressed,
        style: buttonBorderColor != null ? outlineButtonStyle : baseButtonStyle,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox(),
            icon != null
                ? const SizedBox(
                    width: 4,
                  )
                : const SizedBox(),
            Text(
              buttonText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'notosansthai',
                  fontSize: fontSize),
            ),
          ],
        ),
      ),
    );
  }
}
