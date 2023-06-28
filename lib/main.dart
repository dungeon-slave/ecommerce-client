import 'package:core/config/firebase_options.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'app/food_app.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await dataDI.initDependencies();
    runApp(const FoodApp());
}
