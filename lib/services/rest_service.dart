class RestRoutes {
  static const String BASE_URL_TEST = "https://rickandmortyapi.com/api";

  static String get BASE_URL {
    return BASE_URL_TEST;
  }

  // api routes
  static String EPISODE = BASE_URL + "/episode";
  static String CHARACTER = BASE_URL;
}
