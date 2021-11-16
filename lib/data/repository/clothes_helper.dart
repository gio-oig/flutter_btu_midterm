import 'package:flutter_btu_midterm/data/dummy_data.dart';
import 'package:flutter_btu_midterm/data/models/clothes_model.dart';

class ClothesRepository {
  void addClothe(Clothes clothe) {
    DUMMY_DATA.add(clothe);
  }

  void editClothe(int index, Clothes clothe) {
    DUMMY_DATA.replaceRange(index, index + 1, [clothe]);
  }

  void removeClothe(int id) {
    DUMMY_DATA.removeWhere((element) => element.id == id);
  }
}
