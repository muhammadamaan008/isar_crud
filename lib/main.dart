import 'package:flutter/material.dart';
import 'package:isar_crud/View/home_view_model.dart';
import 'package:isar_crud/View/home_view.dart';
import 'package:isar_crud/widgets/custom_alert_dialog.dart';
import 'package:isar_crud/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Operations.connectDb();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Operations()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Scaffold(
            appBar: const CustomAppBar(),
            body: const SafeArea(child: MyList()),
            floatingActionButton: FloatingActionButton(
              elevation: 2,
              backgroundColor: Colors.black,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => const CustomDialog(adBtnPressed: true));
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
                weight: 100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
