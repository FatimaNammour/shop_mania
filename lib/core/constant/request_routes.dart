class RequestRoutes {
  //Auth
  static const String register = "/auth/register";
  static const String login = "/auth/login";
  static const String refreshToken = "/auth/refresh";

  //User
  static const String getUser = "/users/612e4851345dcc333ac6cb24";

  //Category
  static const String categories = "/categories";

  static const String notifications = "/notification/user/";

  //City
  static const String city = "/city";

  //Constants
  static const String getConstants = '/constant/driver';

  //GoogleMap
  static const String getAddress = '/googleMaps/toAddress';
  static const String getLatLng = '/GoogleMaps/fromAddress';
  static const String getPolyLine = '/GoogleMaps/getPloyLine';
}
