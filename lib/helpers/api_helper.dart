
class WeatherAPI {
  String apiKey = 'f4123d6e9899db5c271e98f27b024967'; 
  String baseURL = 'https://samples.openweathermap.org/data/2.5/forecast?q=London&appid=';
  

  WeatherAPI(this.apiKey, this.baseURL);

  //DbTable(this.tableName, this.dbFields);

  //getTableName() => tableName;

  get getApiKey => apiKey;
  set setApiKey(String _apiKey) => apiKey = _apiKey;

  get getBaseUrl => baseURL;
  set setDbFields(String _baseURL) => baseURL = _baseURL;

  // concatenateField(DbField dbField) {
  //   String allowNulls = dbField.allowNulls != false ? "TRUE" : "FALSE";
  //   return allowNulls;
  // }

  // String dbTableName() {
  //   return null;
  // }
}
