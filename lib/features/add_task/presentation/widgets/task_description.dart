import 'package:just_do/app_const/app_exports.dart';

class TaskDescription extends StatelessWidget {
  final TextEditingController textEditingController;

  const TaskDescription({
    super.key,
    required this.textEditingController,
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
          LabelWidget(label: language!.description),
          ScreenUtil().setVerticalSpacing(10.h),
          TextFormField(
            controller: textEditingController,
            cursorColor: AppColors.primaryColor,
            maxLines: 8,
            maxLength: 350,
            style: Theme.of(context).textTheme.labelMedium,
            decoration: InputDecoration(
                counterText: '',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                filled: true,
                fillColor: Theme.of(context).cardColor,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(
                        color: Theme.of(context).cardColor, width: 1)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(
                        color: Theme.of(context).cardColor, width: 1))),
          ),
        ],
      ),
    );
  }
}
