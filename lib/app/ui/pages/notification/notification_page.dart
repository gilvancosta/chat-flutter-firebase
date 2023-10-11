import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/controllers/notification_controller.dart';


class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<NotificationController>(context);
    final items = service.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Notificações'),
      ),
      body: ListView.builder(
        itemCount: service.itemsCount,
        itemBuilder: (ctx, i) => ListTile(
          title: Text(items[i].title),
          subtitle: Text(items[i].body),
          onTap: () => service.remove(i),
        ),
      ),
    );
  }
}