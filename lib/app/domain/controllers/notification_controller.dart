import 'package:flutter/material.dart';

import '../entities/notification/notification_entity.dart';

class NotificationController with ChangeNotifier {
  final List<NotificationEntity> _items = [];

  int get itemsCount {
    return _items.length;
  }

  List<NotificationEntity> get items {
    return [..._items];
  }

  void add(NotificationEntity notification) {
    _items.add(notification);
    notifyListeners();
  }

  void remove(int i) {
    _items.removeAt(i);
    notifyListeners();
  }
}
