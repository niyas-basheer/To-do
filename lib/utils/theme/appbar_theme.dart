import 'package:flutter/material.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
   
      elevation: 5,
      centerTitle: false,
      scrolledUnderElevation: 0,
      surfaceTintColor:Colors.transparent ,
      backgroundColor: Color.fromARGB(75, 158, 158, 158),
      iconTheme: IconThemeData(color: Colors.black, size: 24),
      actionsIconTheme: IconThemeData(color: Colors.black, size: 24),
      titleTextStyle: TextStyle(fontSize:18,color:Colors.black,fontWeight: FontWeight.w600),
    
  );


   static const darkAppBarTheme = AppBarTheme(
   
      elevation: 5,
      centerTitle: false,
      scrolledUnderElevation: 0,
      surfaceTintColor:Colors.black ,
      backgroundColor: Color.fromARGB(255, 48, 48, 48),
      iconTheme: IconThemeData(color: Colors.black, size: 24),
      actionsIconTheme: IconThemeData(color: Colors.white, size: 24),
      titleTextStyle: TextStyle(fontSize:18,color:Colors.white,fontWeight: FontWeight.w600),
    
  );
}
