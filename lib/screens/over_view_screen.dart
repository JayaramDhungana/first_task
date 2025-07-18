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
      body: Column(
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
        ],
      ),
    );
  }
}
