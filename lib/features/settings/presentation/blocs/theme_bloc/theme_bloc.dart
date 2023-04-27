import 'package:just_do/app_const/app_exports.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(const ThemeState(
          isLight: null,
        )) {
    on<ThemeEvent>((event, emit) {
      if (event is ThemeChanged) {
        emit(ThemeState(
            isLight: event.brightness == Brightness.dark ? false : true));
      }
    });
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toMap();
  }
}
