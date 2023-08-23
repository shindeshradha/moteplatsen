import 'package:flutter/material.dart';
import 'package:moteplatsen/screens/user_list_page.dart';

void main() {
  runApp(const MotesplatsenApp());
}

/// Represents the main app widget for the Motesplatsen app.
/// 
/// Author: Shradha Shinde
class MotesplatsenApp extends StatelessWidget {
  const MotesplatsenApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:
          'Dejting för singlar på Mötesplatsen.se - Sveriges bästa dejtingsajt',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UserListPage(
          title: 'Mötesplatsen - Hitta någon att dela livet med'),
    );
  }
}
