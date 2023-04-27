part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTaskEvent extends TaskEvent {
  final String name;
  final String description;

  final DateTime dateTime;

  const AddTaskEvent({
    required this.name,
    required this.description,
    required this.dateTime,
  });
}

class DeleteTaskEvent extends TaskEvent {
  final int index;

  const DeleteTaskEvent({required this.index});
}

class UpdateTaskEvent extends TaskEvent {
  final int index;
 final String name;
  final String description;

  final DateTime dateTime;

  const UpdateTaskEvent({required this.name,
    required this.description,
    required this.dateTime, required this.index});
}
