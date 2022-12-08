import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamsprovider/presentation/providers/countdown_privider.dart';

import 'presentation/pages/home_page.dart';


void main() => runApp(const MyApp());

class  MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers: [
         ChangeNotifierProvider(create: ((_)=> CountdownProvider()))
       ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage()
      ),
    );
  }
}
