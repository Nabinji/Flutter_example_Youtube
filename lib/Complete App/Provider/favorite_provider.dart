import 'package:flutter/material.dart';
import 'package:flutter_example/Complete%20App/models/food.dart';
import 'package:provider/provider.dart';


class FavoriteProvider extends ChangeNotifier {
  final List<Food> _favorite = [];
  List<Food> get favorites => _favorite;
  void toggleFavorite(Food product) {
    if (_favorite.contains(product)) {
      _favorite.remove(product);
    } else {
      _favorite.add(product);
    }
    notifyListeners();
  }

  bool isExist(Food product) {
    final isExist = _favorite.contains(product);
    return isExist;
  }

  static FavoriteProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}
