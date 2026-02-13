class DioConstants {
  static const String baseUrl = 'https://api.gold-api.com/price/'; 
  static const String goldEndpoint = 'XAU';
  static const String silverEndpoint = 'XAG';


  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 10);

  static Map<String, String> defaultHeaders = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'User-Agent': 'GoldyApp/1.0 (Flutter; Emulator; Android)', 
  };
}
