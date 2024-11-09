import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isar/isar.dart';
import 'package:makeen/models/fav_model.dart';
import 'package:makeen/models/score_model.dart';
import 'package:makeen/models/try_model.dart';
import 'package:makeen/models/wrong_answers.dart';
import 'package:makeen/screens/create_your_story.dart';
import 'package:makeen/screens/dashboard_page.dart';
import 'package:makeen/screens/login_page.dart';
import 'package:makeen/screens/navigation_page.dart';
import 'package:makeen/screens/pre_assesment_page.dart';
import 'package:makeen/screens/result_page.dart';
import 'package:makeen/screens/splash_page.dart';
import 'package:makeen/screens/story_page.dart';
import 'package:makeen/screens/story_reading_page.dart';
import 'package:makeen/screens/welcome_page.dart';
import 'package:path_provider/path_provider.dart';

late Isar isar;
void main() async {
  final dir = await getApplicationDocumentsDirectory();
  isar = await Isar.open(
    [WrongAnswersSchema, ScoreModelSchema, FavModelSchema, TryModelSchema],
    directory: dir.path,
  );
  runApp(const MyApp());
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var baseTheme = ThemeData(brightness: Brightness.light);

    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: const Locale('ar', 'SA'),
            supportedLocales: const [
              Locale('ar', 'SA'),
            ],
            localizationsDelegates: const [
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            title: 'Makeen',
            theme: ThemeData(
                colorScheme: ColorScheme(
                  primary: HexColor('#414680'),
                  surface: Colors.white,
                  secondary: const Color(0xFF7ACDC8),
                  brightness: Brightness.light,
                  onError: Colors.red,
                  onSurface: const Color.fromRGBO(158, 158, 158, 1),
                  onPrimary: Colors.white,
                  onSecondary: Colors.black,
                  error: Colors.red,
                ),
                primaryColor: HexColor('#414680'),
                textTheme: GoogleFonts.tajawalTextTheme(baseTheme.textTheme),
                secondaryHeaderColor: HexColor('#414680'),
                useMaterial3: true,
                appBarTheme: AppBarTheme(
                  backgroundColor: HexColor('#414680'),
                  titleTextStyle: TextStyle(
                    color: HexColor('#FFFFFF'),
                    fontSize: 20.0,
                  ),
                ),
                inputDecorationTheme: InputDecorationTheme(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: HexColor('#414680'),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: HexColor('#414680'),
                    ),
                  ),
                ),
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7ACDC8),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )),
            home: SplashPage(),
          );
        });
  }
}



// Question

