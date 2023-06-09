import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:medihelp/controllers/task_controller.dart';

import 'package:medihelp/services/theme_services.dart';
import 'package:medihelp/ui/add_task_bar.dart';
import 'package:medihelp/ui/theme.dart';
import 'package:medihelp/ui/widgets/button.dart';
import 'package:medihelp/ui/widgets/task_tile.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:medihelp/ui/widgets/text_widget.dart';

import '../models/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // custom variables declaration section here...
  DateTime _selectedDate = DateTime.now();
  final _taskController = Get.put(TaskController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      // custom Appbar,,,,,,,,,,,,,,,,,,,,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.theme.backgroundColor,
        leading: GestureDetector(
          onTap: () {
            // change theme from services page
            ThemeServices().switchTheme();
            // notifying fun...

            // schedul notidication based on time...............................
            // notifyHelper.scheduledNotification();
          },
          child: Icon(
            Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
            size: 20,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        centerTitle: true,
        title: TextWidget(
          text: "MediHelp",
          color: Get.isDarkMode ? Colors.white : Colors.black,
          fontsize: 24,
          fontweight: FontWeight.w600,
        ),
        actions: [
          Image(
            image: AssetImage('assets/healthcare.png'),
            width: 33,
            height: 33,
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      // main body.....................
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat.yMMMMd().format(DateTime.now()),
                        style: subHeadingStyle,
                      ),
                      Text("Today", style: headingStyle)
                    ],
                  ),
                ),
                MyButton(
                    label: "+ Add Pill",
                    onTap: () async {
                      await Get.to(AddTaskPage());
                      _taskController.getTasks();
                    })
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20),
            child: DatePicker(
              DateTime.now(),
              height: 90,
              width: 60,
              initialSelectedDate: DateTime.now(),
              selectionColor: primaryClr,
              selectedTextColor: Colors.white,
              dateTextStyle: GoogleFonts.lato(
                textStyle: const TextStyle(
                  //fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              dayTextStyle: GoogleFonts.lato(
                textStyle: const TextStyle(
                  //fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              monthTextStyle: GoogleFonts.lato(
                textStyle: const TextStyle(
                  // fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              onDateChange: (date) {
                //_selectedDate = date;
                setState(() {
                  _selectedDate = date;
                });
              },
            ),
          ),

          const SizedBox(
            height: 10,
          ),
          // show tasks.......
          Expanded(child: Obx(() {
            return ListView.builder(
              itemCount: _taskController.taskList.length,
              itemBuilder: (_, index) {
                //print(_taskController.taskList.length);
                // task instane .......
                Task task = _taskController.taskList[index];
                //print(task.toJson());
                //--------------------------------------------------------------

                if (task.repeat == 'Daily') {
                  // schedual notification
                  DateTime date =
                      DateFormat.jm().parse(task.startTime.toString());
                  var myTime = DateFormat("HH:mm").format(date);
                  //print('My Time is Now!! $myTime');
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    child: SlideAnimation(
                      child: FadeInAnimation(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                //------------------------------------------------
                                //_showBottomSheet(context, _taskController.taskList[index]);
                                //Task task = _taskController.taskList[index];
                                // _showBottomSheet(BuildContext context, Task task)
                                Get.bottomSheet(
                                  Container(
                                    padding: const EdgeInsets.only(top: 4),
                                    height: MediaQuery.of(context).size.height *
                                        0.24,
                                    // color of this container ....
                                    color: Get.isDarkMode
                                        ? darkGreyClr
                                        : Colors.white,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 6,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Get.isDarkMode
                                                ? Colors.grey[600]
                                                : Colors.grey[300],
                                          ),
                                        ),
                                        const Spacer(),
                                        // calling buttons if is completed...
                                        Container(),

                                        // second button.......................
                                        _bottomSheetButtons(
                                            lable: 'Delete',
                                            onTap: () {
                                              _taskController.delete(task);

                                              Get.back();
                                            },
                                            clr: Colors.red[300]!,
                                            context: context),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        // 3rd button.......................
                                        _bottomSheetButtons(
                                            lable: 'Close!',
                                            onTap: () {
                                              Get.back();
                                            },
                                            clr: Colors.red[300]!,
                                            isClose: true,
                                            context: context),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                                //------------------------------------------------
                              },
                              child: TaskTile(task),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                //--------------------------------------------------------------
                if (task.date == DateFormat.yMd().format(_selectedDate)) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    child: SlideAnimation(
                      child: FadeInAnimation(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                //------------------------------------------------
                                //_showBottomSheet(context, _taskController.taskList[index]);
                                //Task task = _taskController.taskList[index];
                                // _showBottomSheet(BuildContext context, Task task)
                                Get.bottomSheet(
                                  Container(
                                    padding: const EdgeInsets.only(top: 4),
                                    height: MediaQuery.of(context).size.height *
                                        0.24,
                                    // color of this container ....
                                    color: Get.isDarkMode
                                        ? darkGreyClr
                                        : Colors.white,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 6,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Get.isDarkMode
                                                ? Colors.grey[600]
                                                : Colors.grey[300],
                                          ),
                                        ),
                                        const Spacer(),
                                        // calling buttons if is completed...
                                        Container(),

                                        // second button.......................
                                        _bottomSheetButtons(
                                            lable: 'Delete',
                                            onTap: () {
                                              _taskController.delete(task);

                                              Get.back();
                                            },
                                            clr: Colors.red[300]!,
                                            context: context),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        // 3rd button.......................
                                        _bottomSheetButtons(
                                            lable: 'Close!',
                                            onTap: () {
                                              Get.back();
                                            },
                                            clr: Colors.red[300]!,
                                            isClose: true,
                                            context: context),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                                //------------------------------------------------
                              },
                              child: TaskTile(task),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                  //-------------------------------------------------------------
                } else {
                  return Container();
                }
              },
            );
          })),
        ],
      ),
    );
  }
}

// _showTasks() {
//   return
// }

// first clolum button...............
// _addTaskBar() {
//   return ;
// }
// _showBottomSheet(BuildContext context, Task task) {
//   //;
// }

// creating button to use reuseable...({}) is ka mtlab optional
_bottomSheetButtons(
    {required String lable,
    required Function()? onTap,
    required Color clr,
    bool isClose = false,
    required BuildContext context}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      height: 55,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        border: Border.all(
            width: 2,
            color: isClose == true
                ? Get.isDarkMode
                    ? Colors.grey[600]!
                    : Colors.grey[300]!
                : clr),
        borderRadius: BorderRadius.circular(20),
        color: isClose == true ? Colors.transparent : clr,
      ),
      // show txt on button......
      child: Center(
        child: Text(
          lable,
          style:
              isClose ? titleStyle : titleStyle.copyWith(color: Colors.white),
        ),
      ),
    ),
  );
}
