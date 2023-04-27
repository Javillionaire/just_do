import 'package:flutter/cupertino.dart';
import 'package:just_do/app_const/app_exports.dart';

class DropDownComponent extends StatelessWidget {
  const DropDownComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context);
    final provider = Provider.of<LocalProvider>(context);
    final locale = provider.locale;
    return DropdownButton2(
      iconStyleData: IconStyleData(
          iconSize: 18.h,
          icon: const Padding(
            padding: EdgeInsets.only(right: 6),
            child: Icon(
              CupertinoIcons.chevron_down,
            ),
          ),
          iconEnabledColor: Theme.of(context).primaryColor),
      menuItemStyleData: MenuItemStyleData(
          height: 30.h, padding: const EdgeInsets.symmetric(horizontal: 6)),
      value: locale.languageCode,
      buttonStyleData: ButtonStyleData(
          elevation: 0,
          height: 30.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border:
                  Border.all(width: 1, color: Theme.of(context).primaryColor))),
      enableFeedback: false,
      underline: const SizedBox(),
      onChanged: (value) {},
      alignment: Alignment.centerRight,
      dropdownStyleData: DropdownStyleData(
          offset: const Offset(0, -5),
          elevation: 0,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border:
                  Border.all(width: 1, color: Theme.of(context).primaryColor),
              color: Theme.of(context).cardColor)),
      items: [
        DropdownMenuItem(
          onTap: () {
            provider.setLocale(const Locale('en'));
          },
          alignment: Alignment.center,
          value: 'en',
          child: Text(
            language!.english,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        DropdownMenuItem(
          onTap: () {
            provider.setLocale(const Locale('ru'));
          },
          alignment: Alignment.center,
          value: 'ru',
          child: Text(
            language.russian,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        DropdownMenuItem(
          onTap: () {
            provider.setLocale(const Locale('uz'));
          },
          alignment: Alignment.center,
          value: 'uz',
          child: Text(
            language.uzbek,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ],
    );
  }
}
