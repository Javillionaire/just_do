import 'package:just_do/app_const/app_exports.dart';

abstract class AppPages {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.addTask:
        return PageAnimation.animatedPageRoute(
            settings,
            AddTaskScreen(
              isNew: true,
            ));
      case AppRoutes.home:
        return PageAnimation.animatedPageRoute(settings, HomeScreen());
      case AppRoutes.settings:
        return PageAnimation.animatedPageRoute(
            settings, const SettingsScreen());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
