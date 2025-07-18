import 'package:first_task/data/hotels_data_list.dart';
import 'package:first_task/data/hotels_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HotelsProvider extends ChangeNotifier {
  List<HotelsModel> hotelsList = [];

  loadHotelsData() {
    hotelsList =
        hotelsDataList
            .map((elements) => HotelsModel.fromJson(elements))
            .toList();
    debugPrint("The data in List is $hotelsList");
    notifyListeners();
  }
}

final hotelsProvider = ChangeNotifierProvider((ref) {
  return HotelsProvider();
});
