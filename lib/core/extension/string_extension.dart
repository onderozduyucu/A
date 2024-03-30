import 'package:easy_localization/easy_localization.dart';

import 'package:fluttermvvmtemplate/core/constants/app/app_constants.dart';

extension StringLocalization on String {
  String get locale => this.tr();

  String? get isValidEmail =>
      RegExp(ApplicationConstants.EMAIL_REGEX).hasMatch(this)
          ? null
          : 'Email does not valid';
}
