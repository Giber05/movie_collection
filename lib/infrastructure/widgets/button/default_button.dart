// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

part 'button_wrapper.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.borderRadius = 8,
    this.isFillParent = false,
    required this.text,
    required this.onPressed,
    this.content,
    this.textStyle,
    this.padding,
    this.backgroundColor,
  }) : super(key: key);
  final double? borderRadius;
  final bool isFillParent;
  final String text;
  final VoidCallback onPressed;
  final Widget? content;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return _ButtonWrapper(
      isFillParent: isFillParent,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: padding ?? EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius != null
                  ? BorderRadius.circular(borderRadius!)
                  : BorderRadius.zero),
          backgroundColor: backgroundColor ?? Colors.red,
        ),
        child: content ??
            Text(
              text,
              style: textStyle,
            ),
      ),
    );
  }
}
