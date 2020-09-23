class Country {
  String name;
  String nativeName;
  String region;
  String subregion;
  int population;
  double area;
  String alpha2Code;
  String capital;
  List<Currency> currencies;

  static Country fromJson(Map<String, dynamic> json) {
    return Country()
      ..name = json["name"] ?? ""
      ..nativeName = json["nativeName"] ?? ""
      ..region = json["region"] ?? ""
      ..subregion = json["subregion"] ?? ""
      ..population = json["population"] ?? 0
      ..area = json["area"] ?? 0.0
      ..alpha2Code = json["alpha2Code"] ?? ""
      ..capital = json["capital"] ?? ""
      ..currencies = (json["currencies"] as List).map((e) => Currency.fromJson(e)).toList() ?? [];
  }

  static List<Country> listCountries(List jsonArray){
    return jsonArray.map((e) => Country.fromJson(e)).toList();
  }

  String get flag => "https://www.countryflags.io/$alpha2Code/flat/64.png";
}

class Currency {
  String code;
  String name;
  String symbol;

  static Currency fromJson(Map<String, dynamic> json) {
    return Currency()
      ..name = json["name"] ?? ""
      ..code = json['code'] ?? ""
      ..symbol = json['symbol'] ?? "";
  }
  @override
  String toString() {
    return "$code - $name - $symbol";
  }
}
