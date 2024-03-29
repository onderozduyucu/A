import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_view_model.dart';

import 'package:fluttermvvmtemplate/core/init/navigation/app_router.dart';
import 'package:fluttermvvmtemplate/view/onboard/model/on_board_model.dart';
import 'package:gen/gen.dart';
import 'package:mobx/mobx.dart';

part 'on_board_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase extends BaseViewModel with Store {
  @override
  void setContext(BuildContext? context) => currentContext = context;
  List<OnBoardModel> onBoardItems = [];

  @observable
  bool isLoading = false;

  @observable
  int currentIndex = 0;

  @action
  void changeCurrentIndex(int value) {
    currentIndex = value;
  }

  @override
  void init() {
    onBoardItems
      ..add(
        OnBoardModel(
          LocaleKeys.onBoard_page1_title,
          LocaleKeys.onBoard_page1_desc,
          Assets.svg.astronaut.path,
        ),
      )
      ..add(
        OnBoardModel(
          LocaleKeys.onBoard_page2_title,
          LocaleKeys.onBoard_page2_desc,
          Assets.svg.chat.path,
        ),
      )
      ..add(
        OnBoardModel(
          LocaleKeys.onBoard_page3_title,
          LocaleKeys.onBoard_page3_desc,
          Assets.svg.relax.path,
        ),
      );
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  Future<void> completeToOnBoard() async {
    changeLoading();
    await localeManager.saveFirstApp();
    changeLoading();
    await currentContext?.router.replace(const LoginRoute());
  }
}
