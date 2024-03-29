import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/constants/app/app_constants.dart';

@immutable

/// Product localization manager
final class LanguageManager extends EasyLocalization {
  /// ProductLocalization need to [child] for a wrap locale item
  LanguageManager({
    required super.child,
    super.key,
  }) : super(
          supportedLocales: _supportedItems,
          path: ApplicationConstants.LANG_ASSET_PATH,
          useOnlyLangCode: true,
        );

  static final List<Locale> _supportedItems = [
    Locales.tr.locale,
    Locales.en.locale,
  ];

  /// Change project language by using [Locales]
  static Future<void> updateLanguage({
    required BuildContext context,
    required Locales value,
  }) =>
      context.setLocale(value.locale);
}

/// Project locale enum for operation and configuration
enum Locales {
  /// Turkish locale
  tr(Locale('tr', 'TR')),

  /// English locale
  en(Locale('en', 'US'));

  const Locales(this.locale);

  /// Locale value
  final Locale locale;
}

// const Text(LocaleKeys.onBoard_page1_title).tr();
