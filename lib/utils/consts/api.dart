class Api {
  String address;
  late String apiUrl;

  Api({required this.address}) {
    apiUrl =
        'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$address?unitGroup=metric&key=U2SGKBJTUMZ9RV47GBNTH372Z&contentType=json';
  }
}
