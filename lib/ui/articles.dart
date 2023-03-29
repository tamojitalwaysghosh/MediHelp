import 'package:flutter/material.dart';
import 'package:medihelp/ui/a1.dart';
import 'package:medihelp/ui/a2.dart';
import 'package:medihelp/ui/a3.dart';
import 'package:medihelp/ui/theme.dart';
import 'package:medihelp/ui/widgets/article_card.dart';
import 'package:medihelp/ui/widgets/text_widget.dart';

class BlogsScreen extends StatefulWidget {
  const BlogsScreen({super.key});

  @override
  State<BlogsScreen> createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: TextWidget(
                  fontsize: 24,
                  fontweight: FontWeight.w500,
                  text: "Health Articles",
                  color: Color.fromARGB(255, 35, 34, 34)),
            ),
          ),
          AticleWidget(
            image: "assets/a1.jpg",
            name: "Health Tips for children",
            page: Blogs1Screen(),
            website:
                'https://www.nebraskamed.com/primary-care/10-tips-to-keep-your-child-healthy-this-school-year',
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                for (int i = 0; i < MediaQuery.of(context).size.width; i++)
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: CircleAvatar(
                      backgroundColor: primaryClr,
                      radius: 1,
                    ),
                  ),
              ],
            ),
          ),
          AticleWidget(
            image: "assets/a2.jpg",
            name: "Health Tips for middle aged",
            page: Blogs2Screen(),
            website:
                'https://www.healthinaging.org/tools-and-tips/tip-sheet-home-safety-tips-older-adults',
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                for (int i = 0; i < MediaQuery.of(context).size.width; i++)
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: CircleAvatar(
                      backgroundColor: primaryClr,
                      radius: 1,
                    ),
                  ),
              ],
            ),
          ),
          AticleWidget(
            image: "assets/a3.jpg",
            name: "Health Tips for the aged",
            page: Blogs3Screen(),
            website:
                'https://www.nationwide.com/lc/resources/home/articles/senior-citizen-safety',
          ),
        ],
      ),
    );
  }
}
