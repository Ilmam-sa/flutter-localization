library ilmam_localization;
export 'localization/app_localizations.dart';
export 'localization/app_localizations_delegate.dart';
export 'localization/app_localizations_setup.dart';
export 'helper/change_language.dart';
export 'helper/current_language.dart';
export 'helper/transelate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'localization/app_localizations_setup.dart';
import 'logic/locale_cubit.dart';

bool lock = false;
Widget ilmamMaterialApp({required String title,required bool debugShowCheckedModeBanner,required ThemeData theme,required Widget home}){
  return BlocBuilder<LocaleCubit, LocaleState>(
    buildWhen: (previousState, currentState) =>
    previousState != currentState,
    builder: (context, localeState) {
      if (!lock) {
        BlocProvider.of<LocaleCubit>(context).getLocalLang();
        lock = true;
      }
      return MaterialApp(
        title: title,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        supportedLocales: AppLocalizationsSetup.supportedLocales,
        localizationsDelegates:
        AppLocalizationsSetup.localizationsDelegates,
        localeResolutionCallback:
        AppLocalizationsSetup.localeResolutionCallback,
        locale: localeState.locale,
        home: home,
        theme: theme,
      );
    },
  );
}
