import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String description;

  @HiveField(1)
  bool isCompleted;

  Task({required this.description, this.isCompleted = false});
}
