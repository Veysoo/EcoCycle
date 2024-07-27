import 'package:flutter/material.dart';

class GeriDonusumItem {
  final String isim;
  final int puan;

  GeriDonusumItem(this.isim, this.puan);
}

class GeriDonusumModel extends ChangeNotifier {
  final List<GeriDonusumItem> _items = [];
  int _toplamPuan = 0;

  List<GeriDonusumItem> get items => _items;
  int get toplamPuan => _toplamPuan;

  void addItem(GeriDonusumItem item) {
    _items.add(item);
    _toplamPuan += item.puan;
    notifyListeners();
  }
}
