import 'package:medihelp/db/db_helper.dart';
import 'package:medihelp/models/task.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    getTasks();
    super.onReady();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }

  //get all the data from table
  Future<void> getTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => new Task.fromJson(data)).toList());
  }

  // delete data......
  void delete(Task task) {
    //var val =
    DBHelper.delete(task);
    //print(val);
    getTasks();
  }

  void markTaskCompleted(int id) async {
    await DBHelper.update(id);
    getTasks();
  }
}
