import 'package:just_do/app_const/app_exports.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState()) {
    on<AddTaskEvent>(_addTaskEvent);
    on<DeleteTaskEvent>(_deleteTaskEvent);
    on<UpdateTaskEvent>(_updateTaskEvent);
  }
  var box = Hive.box<TaskModel>('Tasks');
  Future<void> _addTaskEvent(
      AddTaskEvent event, Emitter<TaskState> emit) async {
    final taskmodel = TaskModel()
      ..name = event.name
      ..description = event.description
      ..dateTime = event.dateTime;
    box.add(taskmodel);
  }

  Future<void> _deleteTaskEvent(
      DeleteTaskEvent event, Emitter<TaskState> emit) async {
    box.deleteAt(event.index);
  }

  Future<void> _updateTaskEvent(
      UpdateTaskEvent event, Emitter<TaskState> emit) async {
    final updatedTaskmodel = TaskModel()
      ..name = event.name
      ..description = event.description
      ..dateTime = event.dateTime;
    box.putAt(event.index, updatedTaskmodel);
  }

  //helper functions
}
