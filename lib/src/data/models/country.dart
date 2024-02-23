class CountryData {
  final String countryId;
  final double probability;

  CountryData({
    required this.countryId,
    required this.probability,
  });

  factory CountryData.fromJson(Map<String, dynamic> json) {
    return CountryData(
      countryId: json['country_id'] != null ? json['country_id'] : '',
      probability: json['probability'] != null ? json['probability'].toDouble() : 0.0,
    );
  }
}
