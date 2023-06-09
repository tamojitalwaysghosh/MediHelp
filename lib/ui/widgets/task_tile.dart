import 'package:flutter/material.dart';
import 'package:medihelp/ui/size_config.dart';
import 'package:medihelp/ui/theme.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/task.dart';

class TaskTile extends StatefulWidget {
  final Task? task;

  TaskTile(this.task);

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    bool setr = false;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        // margin: const EdgeInsets.only(top: 10),
        // width: SizeConfig.orientation == Orientation.landscape
        //     ? SizeConfig.screenWidth / 2
        //     : SizeConfig.screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: _getBGClr(widget.task?.color ?? 0),
        ),

        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.task?.title ?? "",
                    style: GoogleFonts.lato(
                        // ignore: prefer_const_constructors
                        textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        color: Colors.grey[200],
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.task!.startTime} - ${widget.task!.endTime}',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[100],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.task?.note ?? '',
                    style: GoogleFonts.lato(
                      color: Colors.grey[100],
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 60,
              width: 0.5,
              color: Colors.grey[200]!.withOpacity(0.7),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                widget.task!.color == 2
                    ? "NIGHT TIME"
                    : widget.task!.color == 1
                        ? "NOON TIME"
                        : "DAY TIME",
                style: GoogleFonts.lato(
                    textStyle: TextStyle(),
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getBGClr(int? color) {
    switch (color) {
      case 1:
        return pinkClr;
      case 2:
        return bluishClr;

      default:
        return orangeClr;
    }
  }
}
