import 'package:just_do/app_const/app_exports.dart';

class LabelWidget extends StatelessWidget {
  final String label;
  const LabelWidget({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
