import 'package:just_do/app_const/app_exports.dart';

class LongButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onTap;
  const LongButton({
    super.key,
    required this.buttonName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(  enableFeedback: false,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.r)),
            backgroundColor: Theme.of(context).primaryColor,
            fixedSize: Size(double.maxFinite, 54.h),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
        onPressed: onTap,
        child: Text(
          buttonName,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
