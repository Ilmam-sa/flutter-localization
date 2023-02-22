import 'package:flutter/cupertino.dart';

import '../localization/app_localizations.dart';

extension transelation on String {
  String tr( BuildContext context) {
    return AppLocalizations.of(context)!.translate(this)!;
  }
}