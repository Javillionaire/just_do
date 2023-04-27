import 'package:just_do/app_const/app_exports.dart';

class ThemeTile extends StatelessWidget {
  const ThemeTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context);
    return Column(
      children: [
        Container(
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
                language!.mode,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  return TextButton.icon(
                      style: TextButton.styleFrom(
                          enableFeedback: false,
                          foregroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.r))),
                      onPressed: () {
                        BlocProvider.of<ThemeBloc>(context).add(ThemeChanged(
                            brightness: Theme.of(context).brightness));
                      },
                      icon: Theme.of(context).brightness == Brightness.dark
                          ? SvgPicture.asset(
                              AppIcons.moon,
                              color: Colors.grey.shade600,
                              height: 18.h,
                              width: 18.h,
                            )
                          : SvgPicture.asset(
                              AppIcons.sun,
                              color: Colors.yellow,
                              height: 18.h,
                              width: 18.h,
                            ),
                      label: Theme.of(context).brightness == Brightness.dark
                          ? Text(
                              language.night,
                              style: Theme.of(context).textTheme.labelMedium,
                            )
                          : Text(
                              language.day,
                              style: Theme.of(context).textTheme.labelMedium,
                            ));
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
