import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/add_task_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/add':
        return MaterialPageRoute(builder: (_) => AddTaskPage());
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
