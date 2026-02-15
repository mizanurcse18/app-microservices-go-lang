import 'package:flutter/material.dart';
import 'package:erp_app/app.dart';
import 'package:erp_app/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await di.init();
  
  runApp(const App());
}
