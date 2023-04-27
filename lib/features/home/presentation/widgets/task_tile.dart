import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:just_do/app_const/app_exports.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final String description;
  final DateTime dateTime;
  final VoidCallback onTap;
  final Function(BuildContext) endOnTap;
  final Function(BuildContext) startOnTap;
  final int keyvalue;

  const TaskTile({
    super.key,
    required this.title,
    required this.description,
    required this.onTap,
    required this.dateTime,
    required this.endOnTap,
    required this.startOnTap,
    required this.keyvalue,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(keyvalue),
      startActionPane: ActionPane(
          extentRatio: 0.13,
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(6.r),
              padding: EdgeInsets.zero,
              onPressed: startOnTap,
              icon: CupertinoIcons.pen,
              backgroundColor: Colors.grey,
            )
          ]),
      endActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: 0.13,
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(6.r),
              padding: EdgeInsets.zero,
              backgroundColor: Colors.red,
              onPressed: endOnTap,
              icon: CupertinoIcons.trash,
            )
          ]),
      child: ListTile(
        enableFeedback: false,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
        trailing: Text(
          DateFormats.formatPostDate(dateTime),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        onTap: onTap,
        visualDensity: const VisualDensity(vertical: -3),
        dense: true,
        title: Text(title, style: Theme.of(context).textTheme.labelMedium),
        subtitle: Text(
          description,
          style: Theme.of(context).textTheme.titleSmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
