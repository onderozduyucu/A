import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/components/list-view/indicator_list_view.dart';

class OnBoardIndcator extends StatelessWidget {
  const OnBoardIndcator({
    required this.itemCount,
    required this.currentIndex,
    super.key,
  });
  final int itemCount;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return IndactorListView(
      currentIndex: currentIndex,
      itemCount: itemCount,
      onListItem: (index) {
        return const FlutterLogo();
      },
    );
  }
}
