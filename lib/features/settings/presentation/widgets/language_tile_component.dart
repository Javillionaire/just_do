import 'package:just_do/app_const/app_exports.dart';

class LanguageTile extends StatelessWidget {
  const LanguageTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      height: 56.h,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Theme.of(context).cardColor),
      child: Row(
        children: [
          Text(
            language!.language,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Spacer(),
          const DropDownComponent()
        ],
      ),
    );
  }
}
