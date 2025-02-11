import 'package:shared_preferences/shared_preferences.dart';

class CacheNetwork{

  static late SharedPreferences sharedPref;

  static Future cacheInitialization()async{
 sharedPref=await SharedPreferences.getInstance();

  }
 static Future<bool> insertCache({required String key,required String value})async{
    return await sharedPref.setString(key, value);

  }
 static  String getCache({required String key}){
   return sharedPref.getString(key)??"";
  }

  static Future<bool> deleteCache({required String key})async{

    return await sharedPref.remove(key);

  }
}