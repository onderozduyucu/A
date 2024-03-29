import 'package:flutter/material.dart';

import 'package:fluttermvvmtemplate/core/components/button/normal_button.dart';

class TitleTextButton extends StatelessWidget {
  const TitleTextButton({required this.text, super.key, this.onPressed});
  final VoidCallback? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return NormalButton(
      onPressed: onPressed,
      child: Center(
        child: Text(text),
      ),
    );
  }
}
