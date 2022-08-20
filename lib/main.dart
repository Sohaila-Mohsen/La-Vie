import 'package:flutter/material.dart';
import 'package:la_vie/services/dio_helper.dart';
import 'package:la_vie/src/app_root.dart';

import 'core/utils/sp_helper/cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  DioHelper.init();
  runApp(const AppRoot());
}
