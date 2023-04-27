import 'package:just_do/app_const/app_exports.dart';

class MyApp extends StatelessWidget {
  final String localeCode;
  const MyApp({super.key, required this.localeCode});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(390, 844),
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeBloc(),
          ),
          BlocProvider(
            create: (context) => TaskBloc(),
          ),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return ChangeNotifierProvider(
              create: (context) => LocalProvider(localeCode: localeCode),
              builder: (context, child) => MaterialApp(
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                locale: Provider.of<LocalProvider>(context).locale,
                supportedLocales: L10n.all,
                themeMode: state.isLight == null
                    ? ThemeMode.system
                    : state.isLight!
                        ? ThemeMode.light
                        : ThemeMode.dark,
                darkTheme: appThemeData[AppTheme.darkTheme],
                theme: appThemeData[AppTheme.lightTheme],
                builder: (context, child) => MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: child!),
                debugShowCheckedModeBanner: false,
                onGenerateRoute: AppPages.generateRoute,
                initialRoute: AppRoutes.home,
              ),
            );
          },
        ),
      ),
    );
  }
}
