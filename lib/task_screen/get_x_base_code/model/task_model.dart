import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  DateTime date;

  @HiveField(3)
  bool isCompleted;


  Task({
    required this.title,
    required this.description,
    required this.date,
    required this.isCompleted
  });
}