import 'package:flutter/material.dart';
import 'dart:io';

// AppBar (выноска)
PreferredSizeWidget appBar() => AppBar(
    title:  const Text('Список пользователей',
      style: TextStyle(fontSize: 18),
    ),
    actions: <Widget> [
      const SizedBox(width: 10,), // отступ между кнопок
      IconButton(
        tooltip: 'Выход', //
        icon: const Icon(Icons.exit_to_app),
        onPressed: ()=> exit(0),
      ),
    ]
);


//  Панель навигации (выноска)
Widget navDrawer(context) => Drawer(
  child: ListView(padding: EdgeInsets.zero, children: [
    // Задаем оформление
    DrawerHeader(decoration: const BoxDecoration(
      color: Colors.blue,
    ),
      child: Container(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 110, width: 250,
              child: const Image(image: AssetImage('assets/dart-logo.png'),
                fit: BoxFit.cover,
              ),
            ),
            const Text('Навигация по приложению', style: TextStyle(fontSize: 18, color: Colors.black),
              textAlign: TextAlign.center,),
          ],
        ),
      ),
    ),
// Текст-кнопки
    ListTile(
      title: const Text('Список пользователей'),
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4), // уменьшаем ширину элемента, чтобы список был "подтянутым"
      onTap: () {
        Navigator.pushNamed(context, '/users');
      },
    ),

    const Divider(color: Colors.black38, thickness: 2,), // Разделитель

    ListTile(
      title: const Text('Информация о приложении'),
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      onTap: () {
        Navigator.pushNamed(context, '/info');
      },
    ),

    const Divider(color: Colors.black38, thickness: 2,), // Разделитель

  ]),
);


InputDecoration textFieldDecoration(String label, BuildContext context) => InputDecoration(
  filled: true,
  fillColor: Theme.of(context).backgroundColor.withAlpha(100),
  labelText: label,
);
