import 'package:flutter/material.dart';
import 'package:ilanam_assignment/Views/collection_delivery_screen.dart';
import 'package:provider/provider.dart';

import 'Providers/CollectionDeliveryProvider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CollectionDeliveryProvider()),
      ],
      child: MaterialApp(
          title: 'iLanam Assignment',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: CollectionDeliveryScreen()),
    );
  }
}
