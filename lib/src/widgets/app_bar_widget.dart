import 'package:just_do/app_const/app_exports.dart';

class AppBarWidget extends StatelessWidget implements PreferredSize {
  final bool isHome;
  final String title;
  final VoidCallback? onTap;
  const AppBarWidget({
    super.key,
    this.isHome = false,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Theme.of(context).brightness,
        statusBarIconBrightness: Theme.of(context).brightness,
        systemNavigationBarIconBrightness: Theme.of(context).brightness,
        systemNavigationBarColor:
            Theme.of(context).scaffoldBackgroundColor, // Navigation bar
        statusBarColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      leading: !isHome
          ? IconButton(
              enableFeedback: false,
              splashRadius: 24.r,
              onPressed: onTap,
              icon: SvgPicture.asset(
                AppIcons.back,
                height: 24.h,
                width: 24.h,
                color: Theme.of(context).primaryColor,
              ))
          : null,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      automaticallyImplyLeading: false,
      elevation: 0.0,
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      actions: [
        if (isHome)
          IconButton(
              enableFeedback: false,
              splashRadius: 24.r,
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.settings);
              },
              icon: SvgPicture.asset(
                AppIcons.settings,
                height: 24.h,
                width: 24.h,
                color: Theme.of(context).primaryColor,
              ))
      ],
    );
  }

  @override
  // TODO: implement child
  Widget get child => child;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.maxFinite, 56);
}
