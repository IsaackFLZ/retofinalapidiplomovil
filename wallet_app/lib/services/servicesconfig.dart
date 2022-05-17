class ServicesConfig{
  static String baseUrl="https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=2afe86db-5098-4738-9f2e-efaed0881f02&start=1&limit=20&convert=COP";
  static final Map<String,String> headers={
    'start': '1',
    'limit': '10',
    'convert': 'COP'
  };

  static Duration timeOutLimit=const Duration(seconds: 20);
  
}