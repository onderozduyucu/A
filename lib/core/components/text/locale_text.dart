import 'package:flutter/material.dart';

import 'package:fluttermvvmtemplate/core/extension/string_extension.dart';

class LocaleText extends StatelessWidget {
  const LocaleText({required Key key, required this.value}) : super(key: key);
  final String value;
  @override
  Widget build(BuildContext context) {
    return Text(value.locale);
  }
}
