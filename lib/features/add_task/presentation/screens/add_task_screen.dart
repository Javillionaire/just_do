import 'package:just_do/app_const/app_exports.dart';

class AddTaskScreen extends StatelessWidget {
  final bool isNew;
  final TaskModel? task;
  final int? index;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DateTime dateTime = DateTime.now();

  AddTaskScreen({super.key, required this.isNew, this.task, this.index});

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context);
    String title = task != null ? task!.name : '';
    String description = task != null ? task!.description : '';
    TextEditingController titleController = TextEditingController(text: title);
    TextEditingController descriptionController =
        TextEditingController(text: description);
    return WillPopScope(
      onWillPop: () async {
        await showDialog(
            context: context,
            builder: (context) => TaskNotEmptyDialog(isNew: isNew));
        return false;
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            appBar: AppBarWidget(
                onTap: () {
                  if (titleController.text.isEmpty) {
                    Navigator.of(context).pop();
                  } else {
                    showDialog(
                        context: context,
                        builder: (_) => TaskNotEmptyDialog(
                              isNew: isNew,
                            ));
                  }
                },
                title: isNew ? language!.addTask : language!.edit_task),
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TaskTitle(
                        textEditingController: titleController,
                        formKey: formKey),
                    ScreenUtil().setVerticalSpacing(20),
                    TaskDescription(
                      textEditingController: descriptionController,
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: LongButton(
              buttonName: isNew ? language.add : language.save,
              onTap: () {
                final isValid = formKey.currentState!.validate();

                if (isValid) {
                  if (isNew) {
                    BlocProvider.of<TaskBloc>(context).add(AddTaskEvent(
                        name: titleController.text,
                        description: descriptionController.text,
                        dateTime: dateTime));

                    Navigator.of(context).pushNamed(AppRoutes.home);
                  } else {
                    BlocProvider.of<TaskBloc>(context).add(UpdateTaskEvent(
                        index: index!,
                        name: titleController.text,
                        description: descriptionController.text,
                        dateTime: dateTime));

                    Navigator.of(context).pushNamed(AppRoutes.home);
                  }
                }
              },
            )),
      ),
    );
  }
}
