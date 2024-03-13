import 'dart:convert';

class AppConfig {
  String baseUrl;

  AppConfig({
    required this.baseUrl,
  });

  AppConfig copyWith({
    String? baseUrl,
  }) =>
      AppConfig(
        baseUrl: baseUrl ?? this.baseUrl,
      );

  factory AppConfig.fromRawJson(String str) => AppConfig.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AppConfig.fromJson(Map<String, dynamic> json) => AppConfig(
    baseUrl: json["baseUrl"],
  );

  Map<String, dynamic> toJson() => {
    "baseUrl": baseUrl,
  };

  @override
  String toString() {
    return 'baseUrl: $baseUrl';
  }
}
