import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{

 

  //set the onboarding page status
  static Future<void>setOnboardingStatus()async{
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setBool('firstTime', false);
  }

  //set the onboarding page status
  static Future<bool>checkOnBoardingStatus()async{
    final sharedPref = await SharedPreferences.getInstance();
    if(sharedPref.getBool('firstTime')==null){
      return true;
    }
    return sharedPref.getBool('firstTime')!;
  }
  
 

  // Save the dark theme preference
 static Future<void> setDarkThemeOn() async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setBool('darkTheme', true);
  }

  // Save the light theme preference
 static Future<void> setDarkThemeOff() async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setBool('darkTheme', false);
  }
}