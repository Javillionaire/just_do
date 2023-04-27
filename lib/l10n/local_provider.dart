import 'package:just_do/app_const/app_exports.dart';

class LocalProvider extends ChangeNotifier {
  Locale? _locale = L10n.all[0];
  LocalProvider({required String localeCode}) {
    if (localeCode == 'en') {
      _locale = const Locale('en');
    }
    if (localeCode == 'ru') {
      _locale = const Locale('ru');
    }
    if (localeCode == 'uz') {
      _locale = const Locale('uz');
    }
  }

  Locale get locale => _locale!;

  void setLocale(Locale locale) async {
    if (!L10n.all.contains(locale)) return;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _locale = locale;
    preferences.setString('locale', locale.languageCode);

    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}
