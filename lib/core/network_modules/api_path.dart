part of 'network_modules.dart';

// enum untuk masing - masing path endpoin API
enum APIPath {
  TOP_HEADLINES,
}

class APIPathHelper{

  // fungsi ini akan mengambil teks url berdasarkan enum path yang dimasukkan
  static String getValue(APIPath path){
    switch(path){
      case APIPath.TOP_HEADLINES:
        return "/top-headlines";
      default:
        return "";
    }
  }
}
