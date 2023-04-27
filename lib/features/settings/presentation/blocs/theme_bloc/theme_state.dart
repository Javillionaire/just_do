// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'theme_bloc.dart';

@immutable
class ThemeState extends Equatable {
  final bool? isLight;

  const ThemeState({
    required this.isLight,
  });

  ThemeState copyWith({bool? isLight}) {
    return ThemeState(
      isLight: isLight ?? isLight,
    );
  }

  @override
  List<Object?> get props => [isLight];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isLight': isLight,
    };
  }

  factory ThemeState.fromMap(Map<String, dynamic> map) {
    return ThemeState(
      isLight: map['isLight'] != null ? map['isLight'] as bool : null,
    );
  }
}
