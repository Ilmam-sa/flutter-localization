import 'package:flutter/cupertino.dart';

String currentLanguage({required BuildContext context}) {
  /// Returns the current language code
  /// [ar] or [en]
  return Localizations.localeOf(context).languageCode;
}