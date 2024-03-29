import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/components/button/normal_button.dart';

class IconNormalButton extends StatelessWidget {
  const IconNormalButton({required this.icon, super.key, this.onPressed});
  final VoidCallback? onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return NormalButton(
      onPressed: onPressed,
      child: Center(
        child: Icon(icon),
      ),
    );
  }
}
