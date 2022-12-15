class APIConst {
  static String BASE_URL = 'https://newsapi.org/v2/top-headlines?';
  static String API_KEY = 'f3d3b7b7f9374af9a9aa34b13704ad6a';

  static String EGYPT_URL = BASE_URL + 'country=eg&apiKey=' + API_KEY;
  static String SOURCE_URL =
      BASE_URL + 'sources=bbc-news,the-next-web&apiKey=' + API_KEY;
}
