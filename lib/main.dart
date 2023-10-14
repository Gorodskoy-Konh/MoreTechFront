import 'package:flutter/material.dart';

import 'common/di/di.dart';
import 'features/app/presentation/app.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}