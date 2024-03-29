import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/_mixin/error_mixin.dart';
import 'package:fluttermvvmtemplate/view/_mixin/loading_mixin.dart';
import 'package:fluttermvvmtemplate/view/_mixin/mounted_mixin.dart';
import 'package:mobx/mobx.dart';

final class BaseView<T extends Store> extends StatefulWidget  {
    const BaseView({
    required this.viewModel,
    required this.onPageBuilder,
    required this.onModelReady,
    super.key,
    this.onDispose,
  });
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final T viewModel;
  final void Function(T model) onModelReady;
  final VoidCallback? onDispose;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store> extends State<BaseView<T>> with ErrorMixin,MountedMixin,LoadingMixin {
  late T model;
  @override
  void initState() {
    model = widget.viewModel;
    widget.onModelReady(model);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose?.call();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, model);
  }
}
