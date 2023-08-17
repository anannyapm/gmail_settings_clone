import 'package:flutter/material.dart';
import 'package:gmail_clone/responsive/desktop_scaffold.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        fontFamily: GoogleFonts.roboto().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        searchBarTheme: SearchBarThemeData(surfaceTintColor: MaterialStatePropertyAll(Colors.grey.withOpacity(0.3)),backgroundColor: MaterialStatePropertyAll(Colors.grey.withOpacity(0.2))),
        useMaterial3: true,
      ),
      home:const DesktopScaffold()// const ResponsiveLayout(mobileScaffold: MobileScaffold(), desktopScaffold: DesktopScaffold(), tabletScaffold: TabletScaffold()),
    );
  }
}

