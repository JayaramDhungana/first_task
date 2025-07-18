import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouriteProvider extends ChangeNotifier {
  bool isfavourite = false;
  List favouriteIndexList = [];

  void addToFavourite(int index) {
    if (!favouriteIndexList.contains(index)) {
      favouriteIndexList.add(index);
      debugPrint(index.toString());
      notifyListeners();
    } else {
      favouriteIndexList.remove(index);
      notifyListeners();
    }
  }

  void changefavouriteStatues() {
    isfavourite = !isfavourite;
    notifyListeners();
  }
}

final favouriteProvider = ChangeNotifierProvider((ref) {
  return FavouriteProvider();
});
