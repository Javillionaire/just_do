import 'package:just_do/app_const/app_exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context);
    return WillPopScope(
      onWillPop: () async {
        await SystemNavigator.pop();

        return false;
      },
      child: Scaffold(
          appBar: AppBarWidget(
            title: language!.tasks,
            isHome: true,
          ),
          body: BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              final box = Hive.box<TaskModel>('Tasks');
              return ValueListenableBuilder(
                  valueListenable: box.listenable(),
                  builder: (context, box, _) {
                    final task = box.values.toList().cast<TaskModel>();
                    if (task.isNotEmpty) {
                      return ListView.builder(
                        itemCount: task.length,
                        itemBuilder: (context, index) => TaskTile(
                            keyvalue: index,
                            endOnTap: (context) {
                              showDialog(
                                context: context,
                                builder: (_) => DeleteDialog(
                                  deleteIndex: index,
                                ),
                              );
                            },
                            startOnTap: (context) {
                              Navigator.of(context).push(PageRouteBuilder(
                                transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) =>
                                    FadeTransition(
                                  opacity: animation,
                                  child: child,
                                ),
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        BlocProvider(
                                  create: (context) => TaskBloc(),
                                  child: AddTaskScreen(
                                    isNew: false,
                                    task: task[index],
                                    index: index,
                                  ),
                                ),
                              ));
                            },
                            title: task[index].name,
                            description: task[index].description,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => TaskDialog(
                                  title: task[index].name,
                                  description: task[index].description,
                                ),
                              );
                            },
                            dateTime: task[index].dateTime),
                      );
                    } else {
                      return const SizedBox();
                    }
                  });
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: LongButton(
            buttonName: language.addTask,
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.addTask);
            },
          )),
    );
  }
}
