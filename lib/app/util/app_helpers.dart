class AppHelpers {

  static List<int> fragmentVisited = List<int>();

  static const String TIMEOUT = "TimeOut";
  static const String UNAUTHORIZED = "UNAUTHORIZED";

  static const String USER_KEY_PREFS = "user";
  static const String TOKEN_KEY_PREFS = "token";
  static const String FIRST_KEY_PREFS = "first_time";
  static const String EMAIL_KEY_PREFS = "email";
  static const String PASSWORD_KEY_PREFS = "password";
  static const String ADDRESS_KEY_PREFS = "address";

  static const String STATUS_NONE = "NONE";
  static const String STATUS_EXCHANGED = "EXCHANGED";
  static const String STATUS_TRANSFERRED = "TRANSFERRED";
  static const String STATUS_EXPIRED = "EXPIRED";

  static const String REGEX_EMAIL = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static const String CLIENT_ID = "android";
  static const String CLIENT_SECRET = "@android@";
  static const String DEVICE = "dea4490b8f451e11a932d93d6cfa35348e2e41b976";
  static const String APP_TYPE = 'patient';

  static const String TERMS_SLUG = "terminos-y-condiciones";
  static const String POLICIES_SLUG = "politicas-de-privacidad";
}