import 'package:flutter/material.dart';

import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';

class IndactorListView extends StatelessWidget {
  const IndactorListView({
    required this.itemCount,
    required this.onListItem,
    required this.currentIndex,
    super.key,
  });
  final int itemCount;

  final int currentIndex;

  final Widget Function(int index) onListItem;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      shrinkWrap: true,
      itemBuilder: buildPadding,
    );
  }

  Padding buildPadding(BuildContext context, int index) {
    return Padding(
      padding: context.paddingLow,
      child: buildCircleAvatar(index, context),
    );
  }

  CircleAvatar buildCircleAvatar(int index, BuildContext context) {
    return CircleAvatar(
      backgroundColor: isCurrentIndex(index) ? Colors.black12 : Colors.blue,
      radius:
          isCurrentIndex(index) ? context.width * 0.03 : context.width * 0.015,
      child: AnimatedOpacity(
        opacity: opacityValue(index),
        duration: context.normalDuration,
        child: onListItem(index),
      ),
    );
  }

  double opacityValue(int index) => isCurrentIndex(index) ? 1 : 0;

  bool isCurrentIndex(int index) => currentIndex == index;
}
