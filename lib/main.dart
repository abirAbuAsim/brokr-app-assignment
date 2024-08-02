import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/trips/presentation/pages/main_screen.dart';

Future<void> main() async {
  // Ensure the Flutter widgets binding is initialized.
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      child: MaterialApp(
        title: 'Travel App',
        home: MainScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}