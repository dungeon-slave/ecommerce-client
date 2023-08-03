import 'package:core/config/firebase_options.dart';
import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:data/di/data_di.dart';
import 'package:data/providers/local/hive_provider.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'app/food_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  dataDI.initDependencies();
  await appLocator<HiveProvider>().openBoxes();
  setupNavigationDependencies();
  runApp(const FoodApp());
}
