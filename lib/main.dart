import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo1/provider%20data/provider_data.dart';
import 'package:todo1/screens/task_list_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:todo1/screens/test%20screens/newTextScreen.dart';
import 'package:todo1/screens/working%20project/working_project_screen.dart';

void main() {
  runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
}
// the code above is with device preview and the one below is with no device preview

// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, deviceType) {
        return ChangeNotifierProvider(
          create: (BuildContext context) => ProviderData(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            theme: ThemeData(
                textTheme: TextTheme(
                    bodyText2:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                fontFamily: "Montserrat",
                primarySwatch: Colors.green),
            home: WorkingProjectScreen(),
            // home: TaskListScreen(),
          ),
        );
      },
    );
  }
}

// the code above is with device preview and the one below is with no device preview

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Sizer(
//       builder: (BuildContext context, Orientation orientation, deviceType) {
//         return ChangeNotifierProvider(
//           create: (BuildContext context) => ProviderData(),
//           child: MaterialApp(
//             debugShowCheckedModeBanner: false,
//             theme: ThemeData(
//                 textTheme: TextTheme(
//                     bodyText2:
//                         TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
//                 fontFamily: "Montserrat",
//                 primarySwatch: Colors.green),
//             home: WorkingProjectScreen(),
//             // home: TaskListScreen(),
//           ),
//         );
//       },
//     );
//   }
// }
