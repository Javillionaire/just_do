import 'package:just_do/app_const/app_exports.dart';

class TaskTitle extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController textEditingController;

  const TaskTitle({
    super.key,
    required this.textEditingController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelWidget(
            label: language!.task,
          ),
          ScreenUtil().setVerticalSpacing(10.h),
          TextFormField(
              validator: (taskTitle) {
                if (taskTitle != null && taskTitle.isEmpty) {
                  return language.task_not_be_empty;
                }
                return null;
              },
              controller: textEditingController,
              cursorColor: AppColors.primaryColor,
              style: Theme.of(context).textTheme.labelMedium,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  filled: true,
                  fillColor: Theme.of(context).cardColor,
                  errorStyle: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.red),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                          color: Theme.of(context).cardColor, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                          color: Theme.of(context).cardColor, width: 1)))),
        ],
      ),
    );
  }
}
