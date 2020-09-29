part of 'network_modules.dart';

// class ini digunakan untuk menentukan url base api dan mengkategorikan sesuai
// dengan kondisi project, apakah masih dalam debugging atau sudah relase
class APIBase{
  static const apiKey = "846208a48e754b088f85a85bc50d7381";

  static String get baseURL {
    // jika project sudah dalam keadaan release, maka menggunakan base api release
    if (kReleaseMode) {
      return "prod url here";
    } else {
      return "http://newsapi.org/v2";
    }
    
  }
}