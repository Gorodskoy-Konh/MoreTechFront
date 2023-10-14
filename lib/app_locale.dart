import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class AppLocale {
  static const _ru = Locale('ru');

  static const supportedLocales = [_ru];

  static LocalizationsDelegate<AppLocalizations> get delegate =>
      AppLocalizations.delegate;

  static List<LocalizationsDelegate<dynamic>> get localizationDelegates =>
      AppLocalizations.localizationsDelegates;

  static String getCurrentLocale(BuildContext context) =>
      Localizations.localeOf(context).toString();

  static String getFormattedDate(BuildContext context, DateTime date) =>
      DateFormat.yMMMMd(
        AppLocale.getCurrentLocale(context),
      ).format(date);

  static AppLocalizations of(BuildContext context) =>
      AppLocalizations.of(context);

  static bool isRu(Locale locale) => locale == _ru;

  const AppLocale._();
}

extension BuildContextLocale on BuildContext {
  AppLocalizations get locale => AppLocale.of(this);
}
