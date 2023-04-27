import 'package:just_do/app_const/app_exports.dart';

class TaskNotEmptyDialog extends StatelessWidget {
  final bool isNew;
  const TaskNotEmptyDialog({
    super.key,
    required this.isNew,
  });

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context);
    return Dialog(
      backgroundColor: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isNew ? language!.adding : language!.changes,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            ScreenUtil().setVerticalSpacing(20),
            Row(
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                        enableFeedback: false,
                        visualDensity:
                            const VisualDensity(vertical: -2, horizontal: -2),
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.r))),
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.home);
                    },
                    child: Text(language.yes,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: AppColors.white))),
                ScreenUtil().setHorizontalSpacing(8),
                TextButton(
                    style: TextButton.styleFrom(
                        enableFeedback: false,
                        visualDensity:
                            const VisualDensity(vertical: -2, horizontal: -2),
                        foregroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.r))),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      language.no,
                      style: Theme.of(context).textTheme.labelMedium,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
