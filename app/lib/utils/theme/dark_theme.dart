import 'package:flutter/material.dart';

ThemeData customDarkTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xff383838),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xffBA9062),
  ),
  // Text Style.
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 27,
      fontWeight: FontWeight.w400,
      height: 1.2,
      color: Color(0xffBA9062),
    ),

    // Text Style for Text field content.
    titleMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      height: 1,
      color: Color(0xff19335A),
    ),
  ),

  // Text Field Decoration.
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(
        color: Color(0xffBA9062),
      ),
    ),
    filled: true,
    fillColor: Color.fromRGBO(228, 215, 195, 0.5),
    contentPadding: EdgeInsets.only(left: 15, right: 15),
    labelStyle: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      height: 1,
      color: Color(0xff5B5B5B),
    ),
    hintStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      height: 1,
      color: Color(0xff5B5B5B),
    ),
  ),

  // Buttons.
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Color(0xffBA9062)),
      foregroundColor: MaterialStatePropertyAll(Color(0xff19335A)),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
      ),
      fixedSize: MaterialStatePropertyAll(Size(double.infinity, 51)),
      elevation: MaterialStatePropertyAll(0),
      iconSize: MaterialStatePropertyAll(50),
      padding: MaterialStatePropertyAll(EdgeInsets.zero),
      textStyle: MaterialStatePropertyAll(
        TextStyle(
          color: Color(0xff19335A),
          fontWeight: FontWeight.w700,
          height: 1,
          fontSize: 25,
        ),
      ),
    ),
  ),

  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      // backgroundColor: MaterialStatePropertyAll(Color(0xffBA9062)),
      foregroundColor: MaterialStatePropertyAll(Color(0xffBA9062)),
      // shape: MaterialStatePropertyAll(
      //   RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(25)),
      //   ),
      // ),
      // fixedSize: MaterialStatePropertyAll(Size(double.infinity, 51)),
      elevation: MaterialStatePropertyAll(0),
      iconSize: MaterialStatePropertyAll(50),
      mouseCursor: MaterialStatePropertyAll(MouseCursor.uncontrolled),
      // splashFactory: NoSplash.splashFactory,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      overlayColor:
          MaterialStatePropertyAll(Color.fromRGBO(228, 215, 195, 0.1)),
      padding: MaterialStatePropertyAll(EdgeInsets.zero),
      textStyle: MaterialStatePropertyAll(
        TextStyle(
          color: Color(0xffBA9062),
          fontWeight: FontWeight.w500,
          height: 1.33,
          fontSize: 15,
        ),
      ),
    ),
  ),

  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Color(0xffBA9062)),
      foregroundColor: MaterialStatePropertyAll(Color(0xffE4D7C3)),
      iconSize: MaterialStatePropertyAll(30),
      shape: MaterialStatePropertyAll(CircleBorder()),
      alignment: AlignmentDirectional.center,
      fixedSize: MaterialStatePropertyAll(Size(20, 20)),
      padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
    ),
  ),

  checkboxTheme: const CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    fillColor: MaterialStatePropertyAll(Color(0xffBA9062)),
    checkColor: MaterialStatePropertyAll(Color(0xff19335A)),
  ),
);
