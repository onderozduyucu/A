import 'package:flutter/material.dart';

import 'package:fluttermvvmtemplate/core/components/decoration/circle_decoration.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';

class DecorationHelper {
  DecorationHelper({
    required this.context,
  });
  BuildContext context;

  Decoration get circleDecoration =>
      CircleDecoration(color: context.colors.surface, radius: 3);
}
