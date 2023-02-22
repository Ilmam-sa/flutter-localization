import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/locale_cubit.dart';

void changeLanguage({required BuildContext context}) {
  /// Changes the language of the app
  if(Localizations.localeOf(context).languageCode == "ar"){
    BlocProvider.of<LocaleCubit>(context).toEnglish();
  }else{
    BlocProvider.of<LocaleCubit>(context).toArabic();
  }
}