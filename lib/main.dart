import 'package:flutter/material.dart';
import 'package:isar_crud/screens/list_view.dart';
import 'package:isar_crud/reusable_widgets/custom_app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      // themeMode: ThemeMode.dark,
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      // ),
      debugShowCheckedModeBanner: false,
      home: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Scaffold(
          appBar: const MyAppBar(),
          body:  const SafeArea(
            child: MyList()
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor:const  Color(0xFFFFB100),
            onPressed: (){},
            child: const Icon(Icons.add, color: Colors.black, weight: 100,),),
        ),
      ),
    );
  }
}