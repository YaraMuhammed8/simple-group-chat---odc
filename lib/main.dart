
import 'package:chatodc/services/local/shared_preference/cache_helper.dart';
import 'package:chatodc/src/app_root.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  await CacheHelper.init();
  runApp(const AppRoot());
}


















