
import 'package:flutter/material.dart';

import '../../entities/notification/chat_notification_entity.dart';

class ChatNotificationService with ChangeNotifier {
  final List<ChatNotificationEntity> _items = [];

  int get itemsCount {
    return _items.length;
  }

  List<ChatNotificationEntity> get items {
    return [..._items];
  }

  void add(ChatNotificationEntity notification) {
    _items.add(notification);
    notifyListeners();
  }

  void remove(int i) {
    _items.removeAt(i);
    notifyListeners();
  }
}
