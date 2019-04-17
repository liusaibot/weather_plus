

class TemperatureConverter{

  static double kelvinConstant =  273.15;
  
  static double kelvinToCelsius(double temp){
    return temp - kelvinConstant;
  }

  static double kelvinToFahreneit(double temp){
    return (kelvinConstant - temp) * 9/5 + 32;
  }
}