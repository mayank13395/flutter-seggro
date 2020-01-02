class weatherModel {
String temperature;
String weather;

weatherModel({this.temperature, this.weather});

// getting data from json
weatherModel.fromJson(Map<String, dynamic> json) {
temperature = json['temperature'];
weather = json['weather'];
}


// converting data to json
Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['temperature'] = this.temperature;
  data['weather'] = this.weather;
  return data;
}
}