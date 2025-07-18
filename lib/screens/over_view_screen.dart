import 'package:first_task/widgets/expandable_text_widget.dart';
import 'package:first_task/widgets/over_view_options_widget.dart';
import 'package:flutter/material.dart';

class OverViewScreen extends StatefulWidget {
  const OverViewScreen({super.key});

  @override
  State<OverViewScreen> createState() => _OverViewScreenState();
}

class _OverViewScreenState extends State<OverViewScreen> {
  List listOfOverViewImages = [
    "assets/overView3.png",
    "assets/overView1.png",
    "assets/overView2.png",
    "assets/overView3.png",
    "assets/overView4.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 450,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listOfOverViewImages.length,
                itemBuilder: (context, index) {
                  final imageToShow = listOfOverViewImages[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 400,
                      width: 300,
                      child: Image(
                        image: AssetImage(imageToShow),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
              child: SizedBox(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Pokhara",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge!.copyWith(fontSize: 30),
                        ),
                      ],
                    ),

                    //for ExpandableText Widget
                    ExpandableTextWidget(
                      text:
                          "Pokhara is a beautiful city in Nepal known for its lakes, mountains, and natural beauty. It is a tourist hub and offers activities like paragliding, boating, trekking, and more. The city is also a gateway to the Annapurna mountain range.",
                    ),

                    SizedBox(height: 16),

                    //for Options
                    Column(
                      children: [
                        overViewOptionWidget(
                          context: context,
                          text: "Hotels",
                          icon: Icon(Icons.hotel, color: Colors.white),
                        ),
                        overViewOptionWidget(
                          context: context,
                          text: "Things to do",
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                          ),
                        ),
                        overViewOptionWidget(
                          context: context,
                          text: "Restaurants",
                          icon: Icon(Icons.restaurant, color: Colors.white),
                        ),
                        overViewOptionWidget(
                          context: context,
                          text: "Forums",
                          icon: Icon(Icons.forum, color: Colors.white),
                          isLast: true,
                        ),

                        //For Hotels

                        
                      ],
                    ),

                    SizedBox(height: 300),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
