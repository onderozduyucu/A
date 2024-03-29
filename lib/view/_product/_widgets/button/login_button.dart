import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/components/button/icon_button.dart';

class MVVMLoginButton extends StatelessWidget {
  const MVVMLoginButton({super.key, this.onComplete});
  final ValueChanged<String>? onComplete;
  @override
  Widget build(BuildContext context) {
    return IconNormalButton(
      icon: Icons.access_alarm,
      onPressed: () {
        onComplete!('OKEY');
        //  BUSINESS CALL
      },
    );
  }
}
