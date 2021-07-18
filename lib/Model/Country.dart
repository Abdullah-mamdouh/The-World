class Country {
  String name;
  String native;
  String phone;
  String continent;
  String capital;
  String currency;
  List<String> languages;
  String emoji;
  String emojeiU;

  Country(
      {this.name,
      this.native,
      this.phone,
      this.continent,
      this.capital,
      this.currency,
      this.emojeiU,
      this.emoji,
      this.languages});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json["name"] as String,
      native: json["native"] as String,
      phone: json["phone"] as String,
      continent: json["continent"] as String,
      capital: json["capital"] as String,
      currency: json["currency"] as String,
      languages: toList(json["languages"]),
      emoji: json["emoje"] as String,
      emojeiU: json["emojeUi"] as String,
    );
  }
  static List<String> toList(List<dynamic> list) {
    return List<String>.from(list);
  }
}
