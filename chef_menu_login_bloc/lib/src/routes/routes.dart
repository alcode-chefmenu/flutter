import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/login_page.dart';



Map<String,WidgetBuilder> getRoutes(){
  return<String,WidgetBuilder>{
    'HomePage':(_) => HomePage(),
    'LoginPage':(_) => LoginPage(),

  };
}