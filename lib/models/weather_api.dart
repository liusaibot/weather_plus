
class WeatherAPI {
  String apiKey; 
  String baseURL;
  

  WeatherAPI(){
    this.apiKey = 'f4123d6e9899db5c271e98f27b024967';
    this.baseURL = 'https://samples.openweathermap.org/data/2.5/forecast?q=London&appid=';
  }



  get getApiKey => apiKey;
  set setApiKey(String _apiKey) => apiKey = _apiKey;

  get getBaseUrl => baseURL;
  set setDbFields(String _baseURL) => baseURL = _baseURL;

}
