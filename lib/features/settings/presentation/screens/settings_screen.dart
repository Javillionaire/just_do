import 'package:just_do/app_const/app_exports.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBarWidget(title: language!.settings,onTap: () {
         Navigator.of(context).pop();
      },),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ScreenUtil().setVerticalSpacing(20),
            const ThemeTile(),
            ScreenUtil().setVerticalSpacing(20),
            const LanguageTile()
          ],
        ),
      ),
    );
  }
}
