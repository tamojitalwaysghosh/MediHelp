import 'package:flutter/material.dart';
import 'package:medihelp/ui/polosk.dart';
import 'package:medihelp/ui/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medihelp/ui/widgets/text_widget.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  static Future<void> openMap(String location) async {
    String googleUrl = 'https://www.google.com/maps/search/$location';
    final Uri _url = Uri.parse(googleUrl);
    try {
      await launchUrl(_url);
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'something went wrong! call emergency number');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          TextWidget(
            color: Color.fromARGB(255, 32, 32, 32),
            fontsize: 20,
            fontweight: FontWeight.w400,
            text: "Explore Nearby",
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  openMap('pharmacies near me');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: primaryClr,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextWidget(
                          color: Colors.white,
                          fontsize: 16,
                          fontweight: FontWeight.w400,
                          text: "Pharmacy",
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Image.asset(
                          'assets/pharm.png',
                          height: 32,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  openMap('Hospitals near me');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextWidget(
                          color: Colors.white,
                          fontsize: 16,
                          fontweight: FontWeight.w400,
                          text: "Hospitals",
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Image.asset(
                          'assets/hosp.png',
                          height: 32,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          TextWidget(
            color: Color.fromARGB(255, 32, 32, 32),
            fontsize: 20,
            fontweight: FontWeight.w400,
            text: "Speed Dial",
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            child: Police(
              title: 'Ambulance',
              subtitle: "Tap here or dial 1-0-2",
              image: "assets/e5.jpg",
              number: "102",
            ),
          ),
        ],
      ),
    );
  }
}
