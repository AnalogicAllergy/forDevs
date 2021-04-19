import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fordev/ui/components/app_theme.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'factories/pages/login/login_page_factory.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return GetMaterialApp(
      title: "4Dev",
      debugShowCheckedModeBanner: false,
      theme: makeAppTheme(),
      initialRoute: "/login",
      getPages: [
        GetPage(name: "/login", page: makeLoginPage),
        GetPage(
          name: "/surveys",
          page: () => Scaffold(
            body: Text("Enquetes"),
          ),
        ),
      ],
    );
  }
}
