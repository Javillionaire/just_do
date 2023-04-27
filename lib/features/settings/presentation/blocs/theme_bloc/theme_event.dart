part of 'theme_bloc.dart';

@immutable
class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ThemeChanged extends ThemeEvent {
  Brightness brightness;

  ThemeChanged({required this.brightness});

  @override
  List<Object?> get props => [brightness];
}
