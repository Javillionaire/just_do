import 'package:just_do/app_const/app_exports.dart';

abstract class PageAnimation{ static PageRouteBuilder<dynamic> animatedPageRoute(
      RouteSettings settings, Widget screen) {
    return PageRouteBuilder(
      settings:
          settings, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}