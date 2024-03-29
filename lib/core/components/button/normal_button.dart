import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  const NormalButton({super.key, this.child, this.onPressed});
  final Widget? child;

  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
        elevation: MaterialStateProperty.all(10),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
