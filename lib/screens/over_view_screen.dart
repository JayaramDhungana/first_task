import 'package:first_task/provider/hotels_provider.dart';
import 'package:first_task/widgets/expandable_text_widget.dart';
import 'package:first_task/widgets/hotels_data_showing_widgets.dart';
import 'package:first_task/widgets/over_view_options_widget.dart';
import 'package:first_task/widgets/traveller_choice_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OverViewScreen extends ConsumerStatefulWidget {
  const OverViewScreen({super.key});

  @override
  ConsumerState<OverViewScreen> createState() => _OverViewScreenState();
}

class _OverViewScreenState extends ConsumerState<OverViewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(hotelsProvider).loadHotelsData();
    });
  }

  List listOfOverViewImages = [
    "assets/overView3.png",
    "assets/overView1.png",
    "assets/overView2.png",
    "assets/overView3.png",
    "assets/overView4.png",
  ];
  @override
  Widget build(BuildContext context) {
    final listofHotelsDataFromProvider = ref.watch(hotelsProvider).hotelsList;
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
                        SizedBox(height: 16),

                        //traveller choice awards
                        travellerChoiceAwards(context: context),
                        SizedBox(height: 16),
                        //For Hotels
                        Row(
                          children: [
                            Text(
                              "Hotels",
                              style: TextTheme.of(context).bodyLarge!.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "See all",

                              style: TextTheme.of(context).bodyMedium!.copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              maxLines: 2,
                              "Top spots to rest up-charming to classic\n to modern",
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 350,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: listofHotelsDataFromProvider.length,
                            itemBuilder: (context, index) {
                              final hotelsDataToShow =
                                  listofHotelsDataFromProvider[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: hotelsDataShowingWidgets(
                                  hotelName: hotelsDataToShow.hotelName,
                                  imageUrl: hotelsDataToShow.imageUrl,
                                  ratings: hotelsDataToShow.ratings,
                                  raters: hotelsDataToShow.raters,
                                  description: hotelsDataToShow.description,
                                  ref: ref,
                                  index: index,
                                ),
                              );
                            },
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Things to do",
                              style: TextTheme.of(context).bodyLarge!.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "See all",

                              style: TextTheme.of(context).bodyMedium!.copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
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
