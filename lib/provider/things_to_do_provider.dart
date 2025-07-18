import 'package:first_task/data/things_to_do_data_list.dart';
import 'package:first_task/data/things_to_do_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThingsToDoProvider extends ChangeNotifier {
  List<ThingsToDoModel> thingsToDoList = [];

  loadThingsToDoList() {
    thingsToDoList =
        thingsToDoDataList
            .map((element) => ThingsToDoModel.fromJson(element))
            .toList();
    notifyListeners();
  }
}

final thingsTODoProvider = ChangeNotifierProvider((ref) {
  return ThingsToDoProvider();
});
